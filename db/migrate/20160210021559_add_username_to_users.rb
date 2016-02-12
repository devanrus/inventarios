class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usuario, :string
  end
end
