# frozen_string_literal: true

require 'view_component/test_helpers'
require 'view_component/system_test_helpers'
require 'capybara/rspec'

module ComponentMock
  include ActionView::Helpers::OutputSafetyHelper

  def mock_component(klass)
    component = instance_double(klass)

    allow(klass).to receive(:new).and_return(component)
    allow(component).to receive_messages(render: "<span>Mocked #{klass.name}</span>",
                                         render_in: "<span>Mocked #{klass.name}</span>")
  end
end

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.include Rails.application.routes.url_helpers, type: :component
  config.include Devise::Test::ControllerHelpers, type: :component
  config.include ComponentMock, type: :component
  config.include ComponentMock, type: :request

  config.before(:each, type: :component) do
    @request = vc_test_controller.request
  end
end
