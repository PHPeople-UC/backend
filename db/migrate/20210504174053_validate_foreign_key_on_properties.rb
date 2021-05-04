class ValidateForeignKeyOnProperties < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :properties, :users
  end
end
