FactoryGirl.define do
	factory :subscribe do
	  sequence(:email) { |n| "user#{n}@hh.com" }
	  settlement
	end
end