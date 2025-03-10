# frozen_string_literal: true

ActiveRecordDoctor.configure do # rubocop:todo Metrics/BlockLength
  global :ignore_tables, [
    # Ignore internal Rails-related tables.
    'ar_internal_metadata',
    'schema_migrations',
    'active_storage_blobs',
    'active_storage_attachments',
    'action_text_rich_texts',
    'solid_cache_entries',
    'solid_cable_messages',
    'good_jobs',
    'good_job_executions',
    'ahoy_events',
    'ahoy_visits',
    'blazer_audits',
    'blazer_checks',
    'blazer_dashboards',
    'blazer_dashboard_queries',
    'blazer_queries',
    'pay_customers',
    'pay_merchants',
    'pay_payment_methods',
    'pay_subscriptions',
    'pay_charges',
    'pay_webhooks'
  ]

  global :ignore_models, [
    'SolidCache::Entry',
    'SolidCable::Message'
  ]

  detector :undefined_table_references,
           ignore_models: [
             'ActionText::RichText',
             'ActionText::EncryptedRichText',
             'ActiveStorage::VariantRecord',
             'ActiveStorage::Blob',
             'ActiveStorage::Attachment',
             'ActionMailbox::InboundEmail',
             'Blazer::Upload'
           ]

  detector :missing_presence_validation,
           ignore_models: [
             'GoodJob::Execution',
             'GoodJob::Job',
             'GoodJob::BaseExecution',
             'GoodJob::DiscreteExecution'
           ]

  detector :extraneous_indexes,
           ignore_indexes: [
             'index_identities_on_user_id'
           ]

  detector :incorrect_dependent_option,
           ignore_models: [
             'Blazer::Query',
             'Blazer::Dashboard',
             'Pay::Customer',
             'Pay::Braintree::Customer',
             'Pay::FakeProcessor::Customer',
             'Pay::LemonSqueezy::Customer',
             'Pay::PaddleBilling::Customer',
             'Pay::PaddleClassic::Customer',
             'Pay::Stripe::Customer'
           ]
end
