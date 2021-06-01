class AddVerifiedToUser < ActiveRecord::Migration[6.0]
  def up
    ['unconfirmed_seller', 'confirmed_seller'].each do |role|
      Role.create(name: role)
    end
  end

  def down
    ['unconfirmed_seller', 'confirmed_seller'].each do |role|
      Role.delete_by(name: role)
    end
  end
end
