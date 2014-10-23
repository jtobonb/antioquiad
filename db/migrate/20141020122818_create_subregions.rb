class CreateSubregions < ActiveRecord::Migration
  def change
    create_table :subregions do |t|
      t.integer :cod_subregion
      t.string :nombre_subregion

      t.timestamps
    end
  end
end
