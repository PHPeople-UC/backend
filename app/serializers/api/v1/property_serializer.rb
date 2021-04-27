class Api::V1::PropertySerializer < ActiveModel::Serializer
  type :property

  attributes(
    :name,
    :commune,
    :description,
    :price,
    :size,
    :address,
    :geopoints,
    :property_services
  )
end
