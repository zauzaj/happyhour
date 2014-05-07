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

	feature "click on Profile link" do
		background do
			visit dashboard_path

			click_link "Profile"
		end
		scenario "have 'Preview' button" do
			expect(page).to have_button("Preview")
		end

		scenario "have 'Save Changes' link button" do
			expect(page).to have_button("Save Changes")
		end

		scenario "edit profile" do
			fill_in "user_email", with: "novi_email@email.com"
			fill_in "user_user_name", with: "novinik"
			fill_in "user_first_name", with: "novo ime"
			fill_in "user_last_name", with: "novo prezime"
			fill_in "user_mobile_number_1", with: "35147552"
			fill_in "user_mobile_number_2", with: "35144321"
			click_button "Save Changes"

			expect(page).to have_content("Successfully updated")
		end
	end

	feature "click on 'All my adverts' link" do
		scenario "should have no adverts" do
			visit dashboard_path
			click_link "All my adverts"

			expect(page).to have_content("Niste postavili ni jedan oglas")			
		end 
		
		scenario "should have five adverts" do
			5.times do
				FactoryGirl.create(:active_advert, user: user)
			end			
			visit dashboard_path
			click_link "All my adverts"

			expect(page.all('#my-adverts > .col-lg-12').size).to eq 5
		end 
	end
end