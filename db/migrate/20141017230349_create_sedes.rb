class CreateSedes < ActiveRecord::Migration
  def change
    create_table :sedes do |t|
      t.integer :dane_sede
      t.integer :dane_establec
      t.string :localidad
      t.string :nombre
      t.string :zona
      t.string :calendario
      t.string :jornada
      t.string :direccion
      t.string :telefono
      t.string :correo

      t.timestamps
    end
  end
end
