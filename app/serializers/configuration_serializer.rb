class ConfigurationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :key, :value
end
