# frozen_string_literal: true

require 'simplecov'
require 'pundit/rspec'

if ENV.include? 'CODECOV_TOKEN'
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

unless SimpleCov.running
  SimpleCov.start 'rails' do
    add_group 'Actors', 'app/actors'
    add_group 'Components', 'app/components'
    add_group 'Policies', 'app/policies'

    enable_coverage :branch
    primary_coverage :branch
  end
end

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.add_formatter 'Fuubar'
end
