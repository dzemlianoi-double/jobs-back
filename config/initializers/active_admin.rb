ActiveAdmin.setup do |config|
  config.site_title = 'Worker.dp.ua'
  config.authentication_method = :authenticate_admin!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.cancan_ability_class = "Ability"
  config.current_user_method = :current_admin
  config.logout_link_path = :destroy_admin_session_path
  config.comments = false
  config.comments_menu = false
  config.batch_actions = true
  config.localize_format = :long
  config.before_action :set_admin_locale
  config.download_links = %i[csv xml json xls]
end
