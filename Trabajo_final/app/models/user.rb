class User < ApplicationRecord
  enum role: [:client, :admin, :staff]
  validates :branch, presence: true, if: :staff?
  validates :branch, absence: true, if: :admin?
  validates :branch, absence: true, if: :client?
  #has many appointments as client delete cascade
  has_many :appointments, dependent: :destroy
  #has many appointments as staff delete cascade
  has_many :appointments, dependent: :destroy, foreign_key: :staff_id

  def role
    case self[:role]
    when "client"
      "Cliente"
    when "admin"
      "Administrador"
    when "staff"
      "Empleado"
    end
  end

  belongs_to :branch, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
