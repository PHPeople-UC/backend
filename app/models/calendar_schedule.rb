class CalendarSchedule < ApplicationRecord
  belongs_to :user, inverse_of: :calendar_schedules
  belongs_to :property, inverse_of: :calendar_schedules

  validates :start_date, presence: true
  validates :end_date, presence: true
end

# == Schema Information
#
# Table name: calendar_schedules
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)        not null
#  property_id :bigint(8)        not null
#  start_date  :datetime
#  end_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_calendar_schedules_on_property_id  (property_id)
#  index_calendar_schedules_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (property_id => properties.id)
#  fk_rails_...  (user_id => users.id)
#
