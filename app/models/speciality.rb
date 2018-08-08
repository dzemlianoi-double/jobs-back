class Speciality < ApplicationRecord
  acts_as_list

  has_many :speciality_vacancies
  has_many :vacancies, through: :speciality_vacancies

  validates :title, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
