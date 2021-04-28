PROPERTY_SERVICE_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'property_service' },
    attributes: {
      type: :object,
      properties: {
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        description: { type: :string, example: 'Some description', 'x-nullable': true }
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

PROPERTY_SERVICES_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    data: {
      type: "array",
      items: { "$ref" => "#/definitions/property_service" }
    }
  },
  required: [
    :data
  ]
}

PROPERTY_SERVICE_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    data: { "$ref" => "#/definitions/property_service" }
  },
  required: [
    :data
  ]
}
