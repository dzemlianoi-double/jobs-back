class Configuration < ApplicationRecord
  acts_as_list

  enum basic_type: %i[other email address phone_number coordinate social_link telegram_recipient email_recipient]

  validates :basic_type, presence: true
  validates :key, presence: true
  validates :value, presence: true
end
