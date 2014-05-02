require 'spec_helper'

feature "User Dashboard" do 
	let(:user){create(:user)}

	background do
		login user
	end

	scenario "shows welcome message" do
		visit dashboard_path

		expect(page).to have_content "Welcome, #{user.user_name}"
	end

	scenario "have back to home link" do
		visit dashboard_path
		click_link "Back to home"
		
		expect(current_path).to eq root_path
	end
end