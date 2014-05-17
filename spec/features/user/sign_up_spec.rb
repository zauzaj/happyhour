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

	scenario "register with profile image" do
		visit new_user_registration_path

		within '#new_user' do
			fill_in 'user_user_name', with: "NewUser"
			fill_in 'user_password', with: "password"
			fill_in 'user_password_confirmation', with: "password"		
			fill_in 'user_email', with: "user@hh.com"
			fill_in 'user_mobile_number_1', with: "08844838482"
			attach_file 'user_image', Rails.root.join('spec/fixtures/images/ruby.jpg').to_s
			click_button 'Sign up'
		end

		expect(page).to have_css 'img ~ input#user_image'
	end

	scenario "register without profile image" do
		visit new_user_registration_path

		within '#new_user' do
			fill_in 'user_user_name', with: "NewUser"
			fill_in 'user_password', with: "password"
			fill_in 'user_password_confirmation', with: "password"		
			fill_in 'user_email', with: "user@hh.com"
			fill_in 'user_mobile_number_1', with: "08844838482"
			click_button 'Sign up'
		end

		expect(page).not_to have_css 'img ~ input#user_image'
	end
end
