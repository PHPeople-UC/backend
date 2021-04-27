class PropertyService < ApplicationRecord
  belongs_to :property, inverse_of: :property_services
end

# == Schema Information
#
# Table name: property_services
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  property_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_property_services_on_property_id  (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (property_id => properties.id)
#
