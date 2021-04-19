class Api::V1::PropertySerializer < ActiveModel::Serializer
  type :property

  attributes(
    :name,
    :commune,
    :description,
    :geopoints
  )
end
