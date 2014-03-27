require 'spec_helper'

feature "User Dashboard" do 
	let(:user) do
		create(:user)
	end

	background do
		login user
	end

	scenario "welcome user on dashboard" do
		expect(current_path).to eq dashboard_path
		expect(page).to have_content "Welcome, #{user.user_name}"
		save_and_open_page
	end

	scenario "back to home" do 
		click_link "Back to home"
		expect(current_path).to eq root_path
	end
	
	# scenario "dashboard need to have user's details" do
	# 	binding.pry
	# 	expect(page).to have_content("#{user.first_name}")
	# 	expect(page).to have_content("#{user.last_name}")
	# 	expect(page).to have_content("#{user.email}")
	# 	expect(page).to have_content("#{user.mobile_number_1}")
	# 	expect(page).to have_content("#{user.adverts.count}")
	# end

	end