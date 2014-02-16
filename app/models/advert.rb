class Advert < ActiveRecord::Base

	belongs_to :user
	belongs_to :category

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :address, presence: true

	
	PAYMENT = ["CASH", "CARD"]


end