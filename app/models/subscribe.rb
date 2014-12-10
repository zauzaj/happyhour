class Subscribe < ActiveRecord::Base
	belongs_to :settlement

	validates :email, presence: true
end
