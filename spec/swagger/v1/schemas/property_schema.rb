PROPERTY_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'property' },
    attributes: {
      type: :object,
      properties: {
        name: { type: :string, example: "Property 1" },
        commune: { type: :string, example: "Santiago" },
        description: { type: :string, example: "A very nice place" },
        active: { type: :boolean, example: true },
        price: { type: :float, example: 1000 },
        price_unit: { type: :string, example: "UF" },
        size: { type: :float, example: 1000 },
        size_unit: { type: :string, example: "hectare" },
        address: { type: :string, example: "100 example st" }
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
