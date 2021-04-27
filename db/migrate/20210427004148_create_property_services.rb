class CreatePropertyServices < ActiveRecord::Migration[6.0]
  def change
    create_table :property_services do |t|
      t.string :name
      t.text :description
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
