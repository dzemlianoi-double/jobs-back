class ServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :short_description, :full_description, :price, :photo
end
