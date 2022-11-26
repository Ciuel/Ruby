class User < ApplicationRecord
  enum role: [:client, :admin, :personnel]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
   self.role ||= :client
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :branch, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
