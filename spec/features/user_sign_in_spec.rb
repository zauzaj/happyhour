require 'spec_helper'

feature "User - Sign in" do
	
	background do  
		visit root_path 
	end
	
	scenario "invalid login user" do
		fill_in "user_email", with: "foo@bar.com"
		fill_in "user_password", with: "password1"
		click_button "Sign in"
		expect(current_path).to eq user_session_path
		expect(page).to have_content " Invalid email or password. "
	end

	scenario "valid login user" do 
		fill_in "user_email", with:"user@hh.com"
		fill_in "user_password", with: "password"
		click_button "Sign in"
		expect(current_path).to eq dashboard_path
		puts current_path
		expect(page).to have_content "Signed in successfully."
	end

end
