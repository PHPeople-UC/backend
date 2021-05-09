ActiveAdmin.register Property do
  permit_params(
    :name,
    :commune,
    :description,
    :active,
    :price,
    :size,
    :address,
    :user_id,
    :price_unit,
    :size_unit
  )

  filter :name
  filter :commune
  filter :active
  filter :user
  filter :price
  filter :price_unit
  filter :size
  filter :size_unit
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
    column :price_unit
    column :size
    column :size_unit
    column :address
    column :active
    actions
  end
end
