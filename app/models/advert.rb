class Advert < ActiveRecord::Base

	belongs_to :user
	belongs_to :category
	has_many :comments
	MAX_DESCRIPTION_CHARACTERS = 200

	validates :title, presence: true
	validates :description, presence: true, length: 1..MAX_DESCRIPTION_CHARACTERS
	validates :address, presence: true
	validates :location, presence: true
	
	PAYMENT = ["CASH", "CARD"]

  class << self
  	#TODO Potrebno je da se automatski prebauje na inactive ako je oglas aktivan vise od 30 dana
    def active 
      where(status: "active")
    end
  end
end