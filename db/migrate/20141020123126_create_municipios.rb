class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.integer :cod_municipio
      t.string :nombre_municipio
      t.string :cod_subregion

      t.timestamps
    end
  end
end
