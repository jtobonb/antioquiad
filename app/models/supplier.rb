class Supplier < ActiveRecord::Base
  attr_accessible :cantidad, :entidad_ejecutora, :fase, :fecha_entrega, :nombre_programa, :responsable

  has_one :supplier
has_many :equipments
end
