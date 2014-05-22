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

	feature "Edit profile" do
		scenario "Succesful update" do
			visit dashboard_path
			click_link "Profile"

			fill_in "user_user_name", with: "novinik"
			click_button "Save Changes"

			expect(page).to have_content "Successfully updated"
		end

		scenario 'Unsuccessful update' do
			visit dashboard_path
			click_link 'Profile'

			fill_in "user_user_name", with: nil
			click_button "Save Changes"

			expect(page).to have_content "Error"
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