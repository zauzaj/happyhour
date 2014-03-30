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