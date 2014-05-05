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
			click_link "Profile"
		end
		scenario "have 'Preview' button" do
			expect(page).to have_button("Preview")
		end

		scenario "have 'Save Changes' link button" do
			expect(page).to have_button("Save Changes")
		end

		scenario "show modal form on click 'Preview' " do
			click_link 'Profile'
			expect(response).have_tag('div#previewProfile[style = ?]',/display:\s*block/)
		end 
		
	end
end