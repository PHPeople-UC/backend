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

  def roles
    object.roles.map(&:name)
  end

  def with_token?
    @instance_options[:with_token]
  end
end
