class Settlement < ActiveRecord::Base
	has_many :subscribes
	has_many :adverts

end
