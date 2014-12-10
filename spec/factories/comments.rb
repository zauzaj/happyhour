FactoryGirl.define do
	factory :comment do
	  content "Odlican provod"
		owner "Anonymous"
		association :advert, factory: :active_advert	  
	end
end