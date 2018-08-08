class Configuration < ApplicationRecord
  acts_as_list

  enum basic_type: %i[other email address phone_number coordinate social_link]

  validates :basic_type, presence: true
end
