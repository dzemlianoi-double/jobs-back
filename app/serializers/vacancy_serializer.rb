class VacancySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  has_many :specialities

  attributes :id, :title, :country, :city, :salary_min, :arrive_date, :video_url, :offers_quantity, :age_min, :age_max,
             :is_hot, :info, :sex, :experience, :main_photo, :photos

  def main_photo
    return  object.vacancy_photos.main_photo.try(:service_url) if Rails.env.production?
    url_for(object.vacancy_photos.main_photo.image) if object.vacancy_photos.main_photo.present?
  end

  def photos
    object.vacancy_photos.where(is_main: false).map do |photo|
      Rails.env.production? ? photo.image.service_url : url_for(photo.image)
    end
  end
end
