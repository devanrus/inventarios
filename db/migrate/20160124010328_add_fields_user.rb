class AddFieldsUser < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellidos, :string
    add_column :users, :admin, :boolean, default: false
  end
end
