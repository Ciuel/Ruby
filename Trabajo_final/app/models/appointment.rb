class Appointment < ApplicationRecord

  enum status: [:pending, :canceled, :finished]
  belongs_to :branch, optional: true
  belongs_to :user
  belongs_to :staff, optional: true, class_name: 'User'
  validates :date, presence: {message: "El campo es obligatorio"}
  validates :reason, presence: {message: "El campo es obligatorio"}
  validates :comment, presence: {message: "El campo es obligatorio"}, on: :update, if: -> {  !staff_id.blank? }
  validate :date_is_within_branch_hours
  validate :date_is_in_the_future
   def date_is_in_the_future
       if date < Date.today
         errors.add(:date, "La fecha no puede estar en el pasado")
       end
   end
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
