class Service < ApplicationRecord
  acts_as_list

  scope :active, -> { where(active: true) }
  scope :by_position, -> { order(:position) }
end
