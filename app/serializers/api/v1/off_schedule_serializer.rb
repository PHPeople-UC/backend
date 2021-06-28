class Api::V1::OffScheduleSerializer < BaseSerializer
  type :off_schedule

  attributes(
    :day_of_week,
    :start_hour,
    :end_hour,
    :full_day
  )
  attribute :user_id, unless: :with_parent?

  def full_day
    object.full_day?
  end
end
