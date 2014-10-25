class CreatePrincipalEstablecs < ActiveRecord::Migration
  def change
    create_table :principal_establecs do |t|
      t.integer :dane_establec
      t.string :localidad
      t.string :rector
      t.string :nombre
      t.string :zona
      t.string :calendario
      t.string :jornada
      t.string :direccion
      t.string :telefono
      t.string :correo
      t.integer :cod_municipio

      t.timestamps
    end
  end
end
