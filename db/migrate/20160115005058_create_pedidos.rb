class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :codigo
      t.integer :departamento_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :pedidos, :departamento_id
    add_index :pedidos, :user_id
  end
end
