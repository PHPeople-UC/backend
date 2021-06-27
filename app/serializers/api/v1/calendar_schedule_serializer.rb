class Api::V1::CalendarScheduleSerializer < BaseSerializer
  type :calendar_schedule

  attributes(
    :start_date,
    :end_date,
    :reserver_email,
    :reserver_name,
  )

  attribute :property_id, unless: :with_parent?
  attribute :user_id, unless: :with_parent?
end
