class FriendSuggestion < ApplicationRecord
  belongs_to :vacancy

  validates :name, presence: true
  validates :phone_number, presence: true
end
