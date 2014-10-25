class Subregion < ActiveRecord::Base
  attr_accessible :cod_subregion, :nombre_subregion

  has_one :subregion
  has_many :municipios

end
