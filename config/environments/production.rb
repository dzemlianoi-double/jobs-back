# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  # config.require_master_key = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.active_storage.service = :amazon
  # config.force_ssl = true
  config.log_level = :debug
  config.log_tags = [:request_id]

  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    domain:               'worker.dp.ua',
    user_name:            Rails.application.credentials.dig(:sendgrid, :username),
    password:             Rails.application.credentials.dig(:sendgrid, :password),
    authentication:       'plain',
    enable_starttls_auto: true
  }

  config.time_zone = 'Europe/Kiev'
  config.active_record.default_timezone = :local

  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
