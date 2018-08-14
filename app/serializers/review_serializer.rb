class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :first_name, :last_name, :avatar_url, :text

  def avatar_url
    return object.avatar.try(:service_url) if Rails.env.production?
    url_for(object.avatar) if object.avatar.present?
  end
end
