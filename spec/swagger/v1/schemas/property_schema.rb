PROPERTY_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'property' },
    attributes: {
      type: :object,
      properties: {
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        commune: { type: :string, example: 'Some commune', 'x-nullable': true },
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

PROPERTIES_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    data: {
      type: "array",
      items: { "$ref" => "#/definitions/property" }
    }
  },
  required: [
    :data
  ]
}

PROPERTY_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    data: { "$ref" => "#/definitions/property" }
  },
  required: [
    :data
  ]
}
