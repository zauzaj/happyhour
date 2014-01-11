class User < ActiveRecord::Base

	has_many :adverts

	validates :email_adress, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true
end
