class Branch < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :appointments
  validates :name, :address, :telephone, presence: true
  def to_s
    name
  end
end
