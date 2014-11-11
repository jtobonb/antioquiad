class Municipio < ActiveRecord::Base
  attr_accessible :cod_municipio, :cod_subregion, :nombre_municipio
  validates_presence_of :cod_municipio, :cod_subregion, :nombre_municipio
  validates :cod_municipio, :cod_subregion, :numericality => true

  has_one :municipio
  has_many :principal_establecs

end
