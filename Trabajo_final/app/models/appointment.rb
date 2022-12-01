class Appointment < ApplicationRecord
  enum status: [:pending, :canceled, :finished]
  belongs_to :branch
  belongs_to :user
  belongs_to :staff, optional: true, class_name: 'User'

  validate :date_is_within_branch_hours

  def date_is_within_branch_hours
    if date.present?
      schedule = branch.schedules.for_day(date)
      p schedule
      p "------------"*3
      if schedule.start_time.strftime("%H:%M") > date.strftime("%H:%M") ||
        schedule.end_time.strftime("%H:%M") < date.strftime("%H:%M")
        errors.add(:date, "El turno debe estar entre las horas de la sucursal")
      end
    end
  end
end
