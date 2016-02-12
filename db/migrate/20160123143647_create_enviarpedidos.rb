class CreateEnviarpedidos < ActiveRecord::Migration
  def change
    create_table :enviarpedidos do |t|
      t.integer :solicitado
      t.integer :surtido
      t.integer :pedido_id
      t.integer :articulo_id

      t.timestamps null: false
    end
  end
end
