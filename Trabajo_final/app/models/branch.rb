class Branch < ApplicationRecord
  #has many schedules delete cascade
  has_many :schedules, dependent: :destroy
  validates :name, :address, :telephone, presence: true
  def to_s
    name
  end
end
