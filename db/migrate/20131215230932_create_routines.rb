class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :ejercicio1
      t.string :ejercicio2
      t.string :ejercicio3

      t.timestamps
    end
  end
end
