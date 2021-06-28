class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
