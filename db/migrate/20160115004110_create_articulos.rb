class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos, id: false do |t|
      t.primary_key :codigo
      t.string :descripcion
      t.integer :existencia
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
