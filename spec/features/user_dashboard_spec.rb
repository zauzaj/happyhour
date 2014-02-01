require 'spec_helper'

feature "User Dashboard" do 
	let(:user) do
		user = create(:user)
	end

	background do
		sign_in user
	end

	scenario "welcome user on dashboard" do
		expect(current_path).to eq dashboard_path
		expect(page).to have_content "Welcome, #{user.user_name}"
	end

	end