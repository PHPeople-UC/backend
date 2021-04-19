class Api::V1::GeopointSerializer < ActiveModel::Serializer
  type :geopoint

  attributes(
    :latitude,
    :longitude,
    :property_id
  )
end
