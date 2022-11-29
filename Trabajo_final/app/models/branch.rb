class Branch < ApplicationRecord
  #has many schedules delete cascade
  has_many :schedules, dependent: :destroy
end
