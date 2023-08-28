# frozen_string_literal: true

Rails.application.configure do
  config.good_job = {
    execution_mode: Rails.env.test? ? :inline : :external,
    on_thread_error: ->(exception) { Rails.error.report(exception, handled: false) },
    enable_cron: true,
    queue_select_limit: 1000,
    shutdown_timeout: 5.minutes
  }
end
