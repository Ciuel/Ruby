class Appointment < ApplicationRecord
  enum status: [:pending, :canceled, :finished]
  belongs_to :branch
  belongs_to :user
  belongs_to :staff, optional: true, class_name: 'User'
end
