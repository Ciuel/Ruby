class User < ApplicationRecord
  enum role: [:client, :admin, :personnel]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :branch, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
