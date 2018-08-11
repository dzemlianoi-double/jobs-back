class VacancySerializer < ActiveModel::Serializer
  has_many :specialities

  attributes :id, :title, :country, :city, :salary_min, :offers_quantity, :video_url, :arrive_date,
             :age_min, :age_max, :is_hot, :is_on_main, :active, :info, :position
end
