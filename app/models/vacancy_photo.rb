class VacancyPhoto < ApplicationRecord
  acts_as_list

  belongs_to :vacancy
  has_one_attached :image

  validates_presence_of :image, :vacancy_id, :name

  scope :by_position, -> { order(:position) }
  scope :main_photo, -> { find_by(is_main: true) }
end
