ActiveAdmin.register Geopoint do
  permit_params :latitude, :longitude, :property_id

  filter :property

  index do
    selectable_column
    id_column
    column :property
    column :latitude
    column :longitude
    actions
  end
end
