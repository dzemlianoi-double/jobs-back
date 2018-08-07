class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_description, :full_description, :price, :photo
end
