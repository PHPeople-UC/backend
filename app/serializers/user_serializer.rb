class UserSerializer < BaseSerializer
  type :user

  attributes(
    :id,
    :name,
    :last_name,
    :email,
    :roles
  )

  attribute :generate_jwt, if: :with_token?
  attribute :avatar

  def roles
    object.roles.map(&:name)
  end

  def avatar
    if object.avatar.attached?
      { avatar: object.avatar_url }
    end
  end

  def with_token?
    @instance_options[:with_token]
  end
end
