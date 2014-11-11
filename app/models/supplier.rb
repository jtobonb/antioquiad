class Supplier < ActiveRecord::Base
  attr_accessible :cantidad, :entidad_ejecutora, :fase, :fecha_entrega, :nombre_programa, :responsable
  validates_presence_of :cantidad, :entidad_ejecutora, :fase, :fecha_entrega, :nombre_programa, :responsable
  validates :cantidad, :numericality => true

  has_one :supplier
  has_many :equipments
end
