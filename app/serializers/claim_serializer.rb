class ClaimSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number, :text, :name, :position
end
