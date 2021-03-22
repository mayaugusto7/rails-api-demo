class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :kind
end
