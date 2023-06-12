# frozen_string_literal: true

require 'simplecov'
require 'pundit/rspec'
require 'view_component/test_helpers'
require 'view_component/system_test_helpers'
require 'capybara/rspec'

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

  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
