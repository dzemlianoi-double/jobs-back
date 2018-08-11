class Service < ApplicationRecord
  acts_as_list

  has_many :service_photos

  validates_presence_of :name, :full_description, :short_description

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
