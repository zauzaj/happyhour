class Category < ActiveRecord::Base
	has_many :adverts

	validates :name, presence: true
end
