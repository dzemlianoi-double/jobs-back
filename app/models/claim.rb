class Claim < ApplicationRecord
  acts_as_list

  enum source: %i[Website Office Phone Another]

  validates :name, presence: true
  validates :email, email: true
  validates :phone_number, phone: { possible: true, allow_blank: true, types: %i[mobile] }
  validates :email, presence: true, unless: :phone_number?
  validates :phone_number, presence: true, unless: :email?

  scope :by_position, -> { order(:position) }
end
