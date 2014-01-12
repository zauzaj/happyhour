class Advert < ActiveRecord::Base

	belongs_to :user
	belongs_to :category

	validates :title, presence: true
	validates :description, presence: true

	PAYMENT = ["CASH", "CARD"]


end