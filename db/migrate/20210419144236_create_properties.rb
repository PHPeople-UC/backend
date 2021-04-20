class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :commune, null: false
      t.string :description
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
