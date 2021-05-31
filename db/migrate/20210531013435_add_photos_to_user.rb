class AddPhotosToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :link, :text
    add_column :users, :caption, :text
  end
end
