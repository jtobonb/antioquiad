class PrincipalEstablec < ActiveRecord::Base
  attr_accessible :calendario, :correo, :dane_establec, :direccion, :jornada, :localidad, :nombre, :rector, :telefono, :zona, :cod_municipio
  validates_presence_of :calendario, :correo

  has_one :principal_establec
  has_many :sedes
end
