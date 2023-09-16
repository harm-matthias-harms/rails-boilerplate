# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, :js, type: :system) do
    driven_by :headless_chrome
  end
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[headless no-sandbox disable-gpu disable-dev-shm-usage]
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
end
