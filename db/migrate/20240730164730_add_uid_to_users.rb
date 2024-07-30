class AddUidToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :token, :string

    remove_column :users, :email
    remove_column :users, :password
    remove_column :users, :password_digest
  end
end
