class PrincipalEstablec < ActiveRecord::Base
	
  attr_accessible :calendario, :correo, :dane_establec, :direccion, :jornada, :localidad, :nombre, :rector, :telefono, :zona, :cod_municipio
  validates_presence_of :calendario, :dane_establec, :localidad, :rector, :nombre, :correo, :direccion, :jornada, :telefono
  validates :dane_establec, :length => { :is => 12 }
  validates :dane_establec, :telefono, :numericality => true
  validates :dane_establec, uniqueness: true

  has_many :sedes
end