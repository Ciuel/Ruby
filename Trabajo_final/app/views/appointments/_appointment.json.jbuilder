json.extract! appointment, :id, :branch_id, :user_id, :date, :reason, :status, :comment, :staff_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
