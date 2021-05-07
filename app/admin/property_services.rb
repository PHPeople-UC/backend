ActiveAdmin.register PropertyService do
  permit_params :name, :description, :property_id

  filter :property

  index do
    selectable_column
    id_column
    column :name
    column :property
    column :description
    actions
  end
end
