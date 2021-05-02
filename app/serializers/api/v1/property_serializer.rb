class Api::V1::PropertySerializer < BaseSerializer
  type :property

  attributes(
    :name,
    :commune,
    :description,
    :price,
    :size,
    :address
  )

  attribute :geopoints, if: :deep?
  attribute :property_services, if: :deep?

  def geopoints
    object.geopoints.map do |geopoint|
      serializer = Api::V1::GeopointSerializer.new(geopoint, with_parent: true)
      puts_association(serializer)
    end
  end

  def property_services
    object.property_services.map do |property_service|
      serializer = Api::V1::PropertyServiceSerializer.new(property_service, with_parent: true)
      puts_association(serializer)
    end
  end
end
