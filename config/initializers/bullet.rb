if Rails.env.development?
  config.after_initialize do
    Bullet.enable = true
  end
end
