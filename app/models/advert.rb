class Advert < ActiveRecord::Base

	belongs_to :user
	belongs_to :category

	MAX_DESCRIPTION_CHARACTERS = 200

	validates :title, presence: true
	validates :description, presence: true, length: 1..MAX_DESCRIPTION_CHARACTERS
	validates :address, presence: true
	validates :location, presence: true
	
	PAYMENT = ["CASH", "CARD"]


end