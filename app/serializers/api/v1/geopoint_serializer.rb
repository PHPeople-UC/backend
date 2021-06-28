class Api::V1::GeopointSerializer < BaseSerializer
  type :geopoint

  attributes(
    :latitude,
    :longitude,
    :property_id
  )

  attribute :property_id, unless: :with_parent?
end
