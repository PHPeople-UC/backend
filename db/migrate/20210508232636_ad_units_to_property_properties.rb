class AdUnitsToPropertyProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :size_unit, :integer, default: 0
    add_column :properties, :price_unit, :integer, default: 0
  end
end
