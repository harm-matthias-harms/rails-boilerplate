# frozen_string_literal: true

require 'pundit/rspec'

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.add_formatter 'Fuubar'
end
