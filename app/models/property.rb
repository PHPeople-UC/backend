class Property < ApplicationRecord
  has_many :geopoints, inverse_of: :property
  has_many :property_services, inverse_of: :property
  has_many_attached :images

  # nombre
  # comuna
  # geopoints (Creo que postgis) -> PostGios
  # archivos adjunto has many
  # owner
  # descripcion

  # modelo de archivos
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
#
