class Branch < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :appointments
  has_many :users, dependent: :destroy
  validates :name, :address, :telephone, presence: true

  def to_s
    name
  end
end
