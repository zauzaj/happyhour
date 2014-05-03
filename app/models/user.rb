class User < ActiveRecord::Base
	has_many :adverts

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	
  validates :user_name, presence: true, uniqueness: true, length: 4..7 
  validates :mobile_number_1, presence: true, uniqueness: true
end
 	