class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  validates :name, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z]+\z/ }

  has_many :properties, dependent: :delete_all, inverse_of: :user
  has_many :calendar_schedules, dependent: :delete_all, inverse_of: :user
  has_many :off_schedules, dependent: :delete_all, inverse_of: :user

  after_create do
    add_role :unconfirmed_seller
  end

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end

  def avatar_url
    if avatar.attached?
      avatar.blob.service_url
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  last_name              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
