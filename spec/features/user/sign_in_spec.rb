require 'rails_helper'

feature "User - Sign in" do

	background do  
		@user = create(:user)
	end
	
	scenario "invalid login user" do
		visit root_path
		
		within '#login-form' do
			fill_in "user_email", with: @user.email
			fill_in "user_password", with: "password1"
			click_button "Prijavi se"
		end

		expect(page).to have_content "Invalid email or password."
	end

	scenario "valid login user" do
		visit root_path

		within '#login-form' do
			fill_in "user_email", with: @user.email
			fill_in "user_password", with: @user.password
			click_button "Prijavi se"
		end

		expect(page).to have_content "Signed in successfully."
	end
end
