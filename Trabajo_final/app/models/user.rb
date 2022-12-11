class User < ApplicationRecord
  enum role: [:client, :admin, :staff]
  validates :branch, presence: true, if: :staff?
  validates :email, presence: true
  validates :password, presence: true,on: :create
  has_many :appointments, dependent: :destroy
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
