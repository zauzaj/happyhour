require 'spec_helper'

feature "User Dashboard" do 
	let(:user){create(:user)}

	background do
		login user
	end

	scenario "welcome user on dashboard" do
		expect(current_path).to eq dashboard_path
		expect(page).to have_content "Welcome, #{user.user_name}"
	end

	scenario "back to home" do 
		click_link "Back to home"
		expect(current_path).to eq root_path
	end

	feature "clicking on tabs" do
		# scenario "click on profile" do 
		# end
		
		scenario "click on add new advert" do
			fill_in "advert_title", with: "Restoran BatajaBoki"
			fill_in "advert_description", 
				with: "Novo u gradu. Restoran domace kuhinje. Specijlani popusti !"
			check "advert_payment_method_1"
			check "advert_payment_method_2"

			check "advert_is_commentable"
			fill_in "advert_address", with: "Batajnickih zrtava 23"
			fill_in "advert_location", with: "Batajnica"
			fill_in "advert_phone_number", with: "066753268"
			click_button "Postavi oglas"
		end

		# scenario "click on all my adverts" do
		# end
	end

end


# And /I click button "(.*)"/ do |button|
# 	click_button button
# end

# Then /I should see "(.*)"/ do |text|
# 	expect(page.find('h3#advert_description').text).to eq text
# end


# Feature: Add advert
# 	As a restaurant owner
# 	So users can see promotions
# 	I want to add advert


# 	Scenario: Successfully add advert
# 		Given I am on the dashboard page
# 		When I click on Add new advert tab
# 		And I fill in "advert_title" with "Our first advert"
# 		And I fill in "advert_description" with "Our first advert description"
# 		And I click button "Postavi oglas"
# 		And I click button "Izbrisi"
# 		Then I should see "Our first advert"