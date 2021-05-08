class UserSerializer < BaseSerializer
  type :user

  attributes(
    :id,
    :name,
    :last_name,
    :email
  )

  attribute :generate_jwt, if: :with_token?

  def with_token?
    @instance_options[:with_token]
  end
end
