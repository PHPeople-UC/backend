GEOPOINT_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'geopoint' },
    attributes: {
      type: :object,
      properties: {
        latitude: { type: :float, example: 6.66, 'x-nullable': true },
        longitude: { type: :float, example: 6.66, 'x-nullable': true },
        property_id: { type: :integer, example: 666, 'x-nullable': true }
      },
      required: []
    }
  },
  required: [
    :id,
    :type,
    :attributes
  ]
}

GEOPOINTS_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    data: {
      type: "array",
      items: { "$ref" => "#/definitions/geopoint" }
    }
  },
  required: [
    :data
  ]
}

GEOPOINT_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    data: { "$ref" => "#/definitions/geopoint" }
  },
  required: [
    :data
  ]
}
