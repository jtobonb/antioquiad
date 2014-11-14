class Subregion < ActiveRecord::Base
 
  attr_accessible :cod_subregion, :nombre_subregion
  validates_presence_of :cod_subregion, :nombre_subregion
  validates :cod_subregion, :length => { :is => 3 }
  validates :cod_subregion, :numericality => true


  has_many :municipios



end
