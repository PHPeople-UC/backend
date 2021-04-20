FactoryBot.define do
  factory :geopoint do
    association :property
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
