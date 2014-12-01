FactoryGirl.define do
	factory :user do
    first_name "User"
    last_name "Bar"
	  sequence(:user_name){|n| "user#{n}"}
	  password "password"
    sequence(:mobile_number_1){|n| "#{n}"*8}
	  sequence(:email) { |n| "user#{n}@hh.com" }
	end
end