class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :dane_sede
      t.string :tipo
      t.string :origen
      t.date :fecha_entrega
      t.string :nombre
      t.string :fabricante
      t.string :modelo
      t.string :serial
      t.string :procesador
      t.string :memoria_ram
      t.string :disco_duro
      t.string :display
      t.string :sist_operativo

      t.timestamps
    end
  end
end
