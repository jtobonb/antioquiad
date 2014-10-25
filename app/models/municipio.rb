class Municipio < ActiveRecord::Base
  attr_accessible :cod_municipio, :cod_subregion, :nombre_municipio

  has_one :municipio
  has_many :principal_establecs

end
