class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.string :titular

      t.timestamps null: false
    end
  end
end
