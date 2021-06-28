class Geopoint < ApplicationRecord
  belongs_to :property, inverse_of: :geopoints

  validates :latitude, presence: true
  validates :longitude, presence: true
end

# == Schema Information
#
# Table name: geopoints
#
#  id          :bigint(8)        not null, primary key
#  latitude    :float
#  longitude   :float
#  property_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_geopoints_on_property_id  (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (property_id => properties.id)
#
