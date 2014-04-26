require 'spec_helper'

feature "User - Sign up" do
	scenario "register with invalid data " do
		visit new_user_registration_path
		within '#new_user' do
			fill_in 'user_user_name', with: nil
			fill_in 'user_password', with: "password"
			fill_in 'user_password_confirmation', with: "password"		
			fill_in 'user_email', with: "user@hh.com"
			fill_in 'user_mobile_number_1', with: "08844838482"
			click_button 'Sign up'
		end

		expect(page).to have_content "can't be blank"
	end

	scenario "register with valid data" do
		visit new_user_registration_path

		within '#new_user' do
			fill_in 'user_user_name', with: "NewUser"
			fill_in 'user_password', with: "password"
			fill_in 'user_password_confirmation', with: "password"		
			fill_in 'user_email', with: "user@hh.com"
			fill_in 'user_mobile_number_1', with: "08844838482"
			click_button 'Sign up'
		end

		expect(current_path).to eq dashboard_path
	end
end
