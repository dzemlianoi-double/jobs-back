class ServicePhoto < ApplicationRecord
  acts_as_list

  belongs_to :service
  has_one_attached :image

  validates_presence_of :image, :service_id, :name
  validates :is_main, absence: { message: I18n.t('active_admin.validations.service_photo') }, if: :already_has_main_picture?

  scope :by_position, -> { order(:position) }
  scope :main_photo, -> { find_by(is_main: true) }

  private

  def already_has_main_picture?
    service.service_photos.main_photo.present?
  end
end
