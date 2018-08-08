class VacancySerializer < ActiveModel::Serializer
  has_many :specialities

  attributes :id, :title, :country, :city, :salary_min, :salary_max, :offers_quantity,
             :age_min, :age_max, :is_hot, :is_on_main, :active, :info, :position
end
