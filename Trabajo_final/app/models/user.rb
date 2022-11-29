class User < ApplicationRecord
  enum role: [:client, :admin, :staff]
  validates :branch, presence: true, if: :staff?
  validates :branch, absence: true, if: :admin?
  validates :branch, absence: true, if: :client?


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :branch, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
