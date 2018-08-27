Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.time_zone = 'Europe/Kiev'
  config.active_record.default_timezone = :local

  config.active_storage.service = :local
  config.after_initialize do
    Bullet.enable = true
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_deliveries = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    domain:               'localhost',
    user_name:            Rails.application.credentials.dig(:sendgrid, :username),
    password:             Rails.application.credentials.dig(:sendgrid, :password),
    authentication:       'plain',
    enable_starttls_auto: true
  }

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
