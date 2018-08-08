class ClaimSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number, :info, :name, :position
end
