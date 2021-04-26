class UserSerializer < ActiveModel::Serializer
  def with_token?
    @instance_options[:with_token]
  end

  attributes :id, :name, :last_name, :email

  attribute :generate_jwt, if: :with_token?
end
