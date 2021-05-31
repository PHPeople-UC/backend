class AddPhotosToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :link, :text
    add_column :properties, :caption, :text
  end
end
