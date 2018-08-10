class ConfigurationSerializer < ActiveModel::Serializer
  attributes :key, :value, :basic_type
end
