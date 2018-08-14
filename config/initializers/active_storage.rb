if Rails.env.development?
  Rails.application.routes.default_url_options[:host] = ENV.fetch("canonical_host", "http://localhost:3000")
end

ActiveModelSerializers.config.adapter = :json_api