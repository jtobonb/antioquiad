class AddCodMunicipioToPrincipalEstablecs < ActiveRecord::Migration
  def change
    add_column :principal_establecs, :cod_municipio, :integer
  end
end
