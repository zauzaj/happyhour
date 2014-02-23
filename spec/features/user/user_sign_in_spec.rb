require 'spec_helper'

feature "User - Sign in" do

	background do  
		visit root_path
		@user = create(:user)
	end
	
	scenario "invalid login user" do
		save_and_open_page
		fill_in "user_email", with: @user.email
		fill_in "user_password", with: "password1"
		click_button "Sign in"
		expect(current_path).to eq user_session_path
		expect(page).to have_content "Invalid email or password."
	end

	scenario "valid login user" do 
		fill_in "user_email", with: @user.email
		fill_in "user_password", with: @user.password
		click_button "Sign in"
		expect(current_path).to eq dashboard_path
		expect(page).to have_content "Signed in successfully."
		# save_and_open_page
	end
end
