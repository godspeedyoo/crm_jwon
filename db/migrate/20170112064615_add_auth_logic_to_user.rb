class AddAuthLogicToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
  end
end
