class ServicePhoto < ApplicationRecord
  acts_as_list

  belongs_to :service
  has_one_attached :image

  validates_presence_of :image, :service_id, :name

  scope :by_position, -> { order(:position) }
  scope :main_photo, -> { find_by(is_main: true) }
end
