class Review < ApplicationRecord
  acts_as_list

  validates :first_name, presence: true
  validates :text, presence: true

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
