ActiveAdmin.register Property do
  permit_params :name, :commune, :description, :active

  filter :name
  filter :commune
  filter :active
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :commune
    column :description
    column :active
    actions
  end
end
