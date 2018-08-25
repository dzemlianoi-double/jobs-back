class ServiceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :short_description, :full_description, :price, :main_photo, :photos, :icon

  def main_photo
    return unless object.service_photos.main_photo.present?
    return  object.service_photos.main_photo.image.try(:service_url) if Rails.env.production?
    url_for(object.service_photos.main_photo.image)
  end

  def photos
    object.service_photos.where(is_main: false).map do |photo|
      Rails.env.production? ? photo.image.service_url : url_for(photo.image)
    end
  end
end
