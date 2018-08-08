class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :avatar, :text
end
