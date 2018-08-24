class Vacancy < ApplicationRecord
  acts_as_list

  enum sex: %i[Any Male Female Family]

  has_many :speciality_vacancies
  has_many :specialities, through: :speciality_vacancies
  has_many :vacancy_photos
  has_many :claims, as: :reasonable

  validates_presence_of :title, :country, :city, :salary_min, :age_min, :age_max, :offers_quantity, :info
  validates_numericality_of :salary_min, greater_than_or_equal_to: 0
  validates_numericality_of :age_min, greater_than_or_equal_to: 16
  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
  scope :latest, -> { order(created_at: :desc) }
  scope :for_main, -> { where(is_main: true) }
  scope :hot, -> { where(is_hot: true) }

  def country_name
    full_country_name = ISO3166::Country[country]
    full_country_name.translations[I18n.locale.to_s] || country.name
  end
end
