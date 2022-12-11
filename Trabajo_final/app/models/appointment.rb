class Appointment < ApplicationRecord

  enum status: [:pending, :canceled, :finished]
  belongs_to :branch, optional: true
  belongs_to :user
  belongs_to :staff, optional: true, class_name: 'User'
  validates :date, presence: true
  validates :reason, presence: true
  validates :comment, presence: true, on: :update, if: -> {  !staff_id.blank? }
  validate :date_is_within_branch_hours
  validate :appointment_is_in_the_future
   def appointment_is_in_the_future
       if date < Date.today
         errors.add(:date, "La fecha no puede estar en el pasado")
       end
   end

  # validate :appointment_is_unique
  # def appointment_is_unique
  #  if date.present?
  #   if Appointment.where(branch_id: branch_id, staff_id: staff_id, date: date).exists?
  #    errors.add(:date, "No hay turnos disponibles para ese horario)
  #  end
  # end
  #

  def status_to_s
    case self[:status]
    when "pending"
      "Pendiente"
    when "canceled"
      "Cancelado"
    when "finished"
      "Atendido"
    end
  end

  def date_is_within_branch_hours
    if date.present?
      schedule = branch.schedules.for_day(date)
      if schedule.nil?
        errors.add(:date, "La sucursal no abre ese día")
      else
        if schedule.start_time.strftime("%H:%M") > date.strftime("%H:%M") ||
          schedule.end_time.strftime("%H:%M") < date.strftime("%H:%M")
          errors.add(:date, "El turno debe estar entre las horas de la sucursal")
        end
      end
    end
  end
end
