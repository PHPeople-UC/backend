class Api::V1::PropertySerializer < BaseSerializer
  type :property

  attributes(
    :name,
    :commune,
    :description,
    :owner,
    :address
  )

  attribute :size
  attribute :price
  attribute :geopoints, if: :deep?
  attribute :property_services, if: :deep?
  attribute :blobs_url

  def size
    { value: object.size, unit: object.size_unit }
  end

  def price
    { value: object.price, unit: object.price_unit }
  end

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

  def blobs_url
    urls = []
    if object.images.attached?
      object.images.blobs.each do |blob|
        urls.append(blob.service_url)
      end
    end
    { blobs: urls }
  end

  def owner
    puts_association(UserSerializer.new(object.user))
  end
end
