FactoryBot.define do
  factory :off_schedule do
    day_of_week { 1 }
    start_hour { "2021-06-18 14:52:05" }
    end_hour { "2021-06-18 14:52:05" }
    user { nil }
  end
end
