FROM ruby:3.3.6-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
  BUNDLE_DEPLOYMENT="1" \
  BUNDLE_PATH="/usr/local/bundle" \
  BUNDLE_WITHOUT="development test"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems and node modules
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential curl git libpq-dev libvips unzip

# Install JavaScript dependencies
ENV BUN_INSTALL=/usr/local/bun
ENV PATH=/usr/local/bun/bin:$PATH
RUN curl -fsSL https://bun.sh/install | bash

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
  rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
  bundle exec bootsnap precompile --gemfile

# Install node modules
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

RUN SETTINGS_SKIP_VALIDATION=true ./bin/rails assets:precompile


# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y curl libvips postgresql-client libjemalloc2 && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2"

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
  chown -R rails:rails db log storage tmp
USER rails:rails

HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
  CMD curl --fail http://localhost:3000/health || exit 1

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 80
CMD ["./bin/thrust", "./bin/rails", "server"]
