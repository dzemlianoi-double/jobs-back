class Service < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
