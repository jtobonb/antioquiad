class Equipment < ActiveRecord::Base
  attr_accessible :dane_sede, :disco_duro, :display, :fabricante, :fecha_entrega, :memoria_ram, :modelo, :nombre, :origen, :procesador, :serial, :sist_operativo, :tipo
  validates_presence_of :dane_sede, :disco_duro, :display, :fabricante, :fecha_entrega, :memoria_ram, :modelo, :nombre, :origen, :procesador, :serial, :sist_operativo, :tipo
end
