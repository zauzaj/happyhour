class User < ActiveRecord::Base

	has_many :adverts

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	validates :email, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true
end
