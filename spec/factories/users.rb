FactoryGirl.define do
	
	factory :user do
	  first_name "Foo"
	  last_name "Bar"
	  user_name "user"
	  password "password"
	  mobile_number_1 "0609999999"
	  sequence(:email) { |n| "user#{n}@hh.com" }
	end
	
end