class Service < ApplicationRecord
  acts_as_list

  has_many :service_photos

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
