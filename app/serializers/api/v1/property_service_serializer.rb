class Api::V1::PropertyServiceSerializer < BaseSerializer
  type :property_service

  attributes(
    :name,
    :description
  )

  attribute :property_id, unless: :with_parent?
end
