class Municipio < ActiveRecord::Base
 
  attr_accessible :cod_municipio, :cod_subregion, :nombre_municipio
  validates_presence_of :cod_municipio, :cod_subregion, :nombre_municipio
  validates :cod_municipio, :cod_subregion, :numericality => true
  validates :cod_municipio, uniqueness: true

  belongs_to :subregion
  has_many :principal_establecs

end
