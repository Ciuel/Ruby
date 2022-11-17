class Branch < ApplicationRecord
  has_many :office_hours, dependent: :destroy
end
