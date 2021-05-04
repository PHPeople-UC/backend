class AddForeignKeyOnProperties < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :properties, :users, validate: false
  end
end
