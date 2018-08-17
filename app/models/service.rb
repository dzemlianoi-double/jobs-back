class Service < ApplicationRecord
  acts_as_list

  has_many :service_photos

  validates_presence_of :name, :full_description, :short_description
  validates_numericality_of :price, greater_than_or_equal_to: 0, only_integer: true

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
  scope :latest, -> { order(created_at: :desc) }
  scope :for_main, ->(number = 6) { last(number) }
end
