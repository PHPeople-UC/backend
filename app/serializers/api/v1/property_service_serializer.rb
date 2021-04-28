class Api::V1::PropertyServiceSerializer < ActiveModel::Serializer
  type :property_service

  attributes(
    :name,
    :description
  )
end
