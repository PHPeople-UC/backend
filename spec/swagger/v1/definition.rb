API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    property: PROPERTY_SCHEMA,
    properties_collection: PROPERTIES_COLLECTION_SCHEMA,
    property_resource: PROPERTY_RESOURCE_SCHEMA,
    geopoint: GEOPOINT_SCHEMA,
    geopoints_collection: GEOPOINTS_COLLECTION_SCHEMA,
    geopoint_resource: GEOPOINT_RESOURCE_SCHEMA,
  }
}
