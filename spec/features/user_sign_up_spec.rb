require 'spec_helper'

feature "User - Sign up" do
	
	background do
		visit new_user_registration_path
	end
	
	

	scenario "register with invalid data " do
		fill_in 'user_user_name', with: nil
		fill_in 'user_password', with: "password"
		fill_in 'user_password_confirmation', with: "password"		
		fill_in 'user_email', with: "user@hh.com"
		fill_in 'user_mobile_number_1', with: "08844838482"
		expect(current_path).to eq new_user_registration_path
		expect(page).to have_content "can't be blank"
	end

	scenario "register with valid data " do
		fill_in 'user_user_name', with: "NewUser"
		fill_in 'user_password', with: "password"
		fill_in 'user_password_confirmation', with: "password"		
		fill_in 'user_email', with: "user@hh.com"
		fill_in 'user_mobile_number_1', with: "08844838482"
		expect(current_path).to eq root_path
	end

end
