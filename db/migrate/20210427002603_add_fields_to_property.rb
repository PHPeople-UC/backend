class AddFieldsToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :price, :float
    add_column :properties, :size, :float
    add_column :properties, :address, :text
  end
end


