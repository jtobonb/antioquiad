class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :nombre_programa
      t.string :entidad_ejecutora
      t.string :fase
      t.string :fecha_entrega
      t.string :responsable
      t.integer :cantidad
      t.text :observaciones

      t.timestamps
    end
  end
end
