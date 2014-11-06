class Sede < ActiveRecord::Base
  attr_accessible :calendario, :correo, :dane_establec, :dane_sede, :direccion, :jornada, :localidad, :nombre, :telefono, :zona
  validates_presence_of :calendario, :correo, :dane_establec, :dane_sede, :direccion, :jornada, :localidad, :nombre, :telefono, :zona
  validates :dane_establec, :dane_sede, :length => { :is => 12 }
  validates :dane_establec, :dane_sede, :telefono, :numericality => true

end
