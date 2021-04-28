API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    property_service: PROPERTY_SERVICE_SCHEMA,
    property_services_collection: PROPERTY_SERVICES_COLLECTION_SCHEMA,
    property_service_resource: PROPERTY_SERVICE_RESOURCE_SCHEMA,
    property: PROPERTY_SCHEMA,
    properties_collection: PROPERTIES_COLLECTION_SCHEMA,
    property_resource: PROPERTY_RESOURCE_SCHEMA,
    geopoint: GEOPOINT_SCHEMA,
    geopoints_collection: GEOPOINTS_COLLECTION_SCHEMA,
    geopoint_resource: GEOPOINT_RESOURCE_SCHEMA,
  }
}
