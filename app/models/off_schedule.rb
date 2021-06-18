class OffSchedule < ApplicationRecord
  enum day_of_week: {
    monday: 0,
    tuesday: 1,
    wednesday: 2,
    thursday: 3,
    friday: 4,
    saturday: 5,
    sunday: 6
  }
  belongs_to :user, inverse_of: :off_schedules

  validates :day_of_week, numericality: { in: 0..6 }
  validates :start_hour, numericality: { in: 0..23 }
  validates :end_hour, numericality: { in: 0..23 }
  validate :starts_before_ends

  def full_day?
    start_hour.zero? && end_hour == 23
  end

  protected

  def starts_before_ends
    if start_hour && end_hour && end_hour <= start_hour
      errors.add(:end_hour,
                 'end time has to be after start time')
    end
  end
end

# == Schema Information
#
# Table name: off_schedules
#
#  id          :bigint(8)        not null, primary key
#  day_of_week :integer          default("monday")
#  start_hour  :integer          default(0)
#  end_hour    :integer          default(23)
#  user_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_off_schedules_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
