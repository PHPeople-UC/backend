class Property < ApplicationRecord
  enum size_unit: { meters: 0, hectare: 1 }
  enum price_unit: { uf: 0, clp: 1 }

  has_many :geopoints, inverse_of: :property
  has_many :property_services, inverse_of: :property
  has_many_attached :images

  belongs_to :user, inverse_of: :properties

  validates :name, presence: true
  validates :commune, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :size, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

# == Schema Information
#
# Table name: properties
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  commune     :string           not null
#  description :string
#  active      :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  price       :float
#  size        :float
#  address     :text
#  user_id     :bigint(8)        not null
#  size_unit   :integer
#  price_unit  :integer
#
# Indexes
#
#  index_properties_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
