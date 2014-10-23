class Sede < ActiveRecord::Base
  attr_accessible :calendario, :correo, :dane_establec, :dane_sede, :direccion, :jornada, :localidad, :nombre, :telefono, :zona
end
