class User < ActiveRecord::Base
	has_many :adverts
	mount_uploader :image, ImageUploader
	
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	
  validates :user_name, presence: true, uniqueness: true, length: 4..20
   
end
 	