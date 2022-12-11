class User < ApplicationRecord
  enum role: [:client, :admin, :staff]
  validates :branch, presence: true, if: :staff?
  validates :branch, absence: true, if: :admin?
  validates :branch, absence: true, if: :client?
  #validate email and password presence on create write the error messages in spanish
  validates :email, presence: { message: "El correo electrónico es obligatorio" },on: :create
  validates :password, presence: { message: "La contraseña es obligatoria" },on: :create
  #has many appointments as client delete cascade
  has_many :appointments, dependent: :destroy
  #has many appointments as staff delete cascade
  has_many :appointments, dependent: :destroy, foreign_key: :staff_id

  def role_to_s
    case self[:role]
    when "client"
      "Cliente"
    when "admin"
      "Administrador"
    when "staff"
      "Personal"
    end
  end

  belongs_to :branch, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
