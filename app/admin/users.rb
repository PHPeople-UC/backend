ActiveAdmin.register User do
  actions :all, except: [:new, :create]
  permit_params :name, :last_name

  filter :email
  filter :name
  filter :last_name
  filter :roles

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :last_name
    actions
  end
end
