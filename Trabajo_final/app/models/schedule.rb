class Schedule < ApplicationRecord
  DIAS = %w[Domingo Lunes Martes Miercoles Jueves Viernes Sabado]

  def self.for_day (date)
    find_by day: DIAS[date.wday]
  end

  belongs_to :branch
  validates :day, :start_time, :end_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time , message: ": El tiempo de finalización debe ser mayor al de inicio"}
  validates :day, inclusion: { in: DIAS, message: "%{value} no es un dia" }

  validates :day, uniqueness: { scope: :branch_id,
                                message: "Ya existe un horario para este dia" }


end
