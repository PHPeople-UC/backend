class AddUserToProperties < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :properties, :user, null: false, index: {algorithm: :concurrently}
  end
end
