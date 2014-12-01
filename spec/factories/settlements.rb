FactoryGirl.define do 
	factory :settlement do
		sequence(:name) { |n| "opstina#{n}" }
	end
end