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
    column :roles
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :last_name
      f.input :roles
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :last_name
      row :roles
    end
  end
end
