ActiveAdmin.register Property do
  permit_params :name, :commune, :description, :active, :price, :size, :address, :user_id

  filter :name
  filter :commune
  filter :active
  filter :user
  filter :price
  filter :size
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :commune
    column :user
    column :description
    column :price
    column :size
    column :address
    column :active
    actions
  end
end
