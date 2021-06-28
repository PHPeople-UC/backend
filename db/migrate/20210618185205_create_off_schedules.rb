class CreateOffSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :off_schedules do |t|
      t.integer :day_of_week, default: 0
      t.integer :start_hour, default: 0
      t.integer :end_hour, default: 23
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
