class Claim < ApplicationRecord
  acts_as_list

  enum source: %i[Website Office Phone Another]

  belongs_to :reasonable, polymorphic: true

  validates :name, presence: true
  validates :email, email: true
  validates :phone_number, phone: { possible: true, allow_blank: true, types: %i[mobile] }
  validates :email, presence: true, unless: :phone_number?
  validates :phone_number, presence: true, unless: :email?

  scope :by_position, -> { order(:position) }

  def claim_type
    case reasonable.class.to_s
    when 'Vacancy' then { name: 'вакансию', title: reasonable.title }
    when 'Service' then { name: 'услугу', title: reasonable.name }
    end
  end
end
