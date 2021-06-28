class CreateGeopoints < ActiveRecord::Migration[6.0]
  def change
    create_table :geopoints do |t|
      t.float :latitude
      t.float :longitude
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
