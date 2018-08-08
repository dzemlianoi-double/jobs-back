class Review < ApplicationRecord
  acts_as_list

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :text, presence: true

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
