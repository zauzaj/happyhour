class Advert < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments

	accepts_nested_attributes_for :comments
  serialize :payment_methods, Array

	PAYMENT = [
             {id: 1, name: "CASH"},
             {id: 2,name: "CARD"}
            ]
  MAX_DESCRIPTION_CHARACTERS = 200

  validates :title, presence: true
  validates :description, presence: true, length: 1..MAX_DESCRIPTION_CHARACTERS
  validates :address, presence: true
  validates :location, presence: true

  class << self
  	#TODO Potrebno je da se automatski prebauje na inactive ako je oglas aktivan vise od 30 dana
    def active 
      where(:active => true)
    end
  end
end