class AddDataToCalendarSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :calendar_schedules, :reserver_email, :string
    add_column :calendar_schedules, :reserver_name, :string
  end
end
