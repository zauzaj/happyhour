require 'spec_helper'

feature Advert do
	let(:user) { create :user}
	# let!(:advert) { create(:active_advert, user: user) }

	feature "new advert" do
		scenario "successfull creation" do
			login user
			visit dashboard_path
			
			click_link 'Add new advert'
			fill_in "advert_title", with: "Restoran BatajaBoki"
			fill_in "advert_description", 
				with: "Novo u gradu. Restoran domace kuhinje. Specijlani popusti!"
			check "advert_payment_method_1"
			check "advert_payment_method_2"
			check "advert_commentable"
			fill_in "advert_address", with: "Batajnickih zrtava 23"
			fill_in "advert_location", with: "Batajnica"
			fill_in "advert_phone_number", with: "066753268"
			click_button "Postavi oglas"

			expect(page).to have_content 'Novo u gradu. Restoran domace kuhinje. Specijlani popusti!'
		end
	end

	feature "index page" do
		background do
			@advert = FactoryGirl.create(:active_advert, user: user, comments_count: 0)
		end

		scenario "expect page to have one advert" do
			visit adverts_path

			expect(page.all('#adverts > .col-lg-4').size).to eq 1
		end

		scenario "have link to advert details page" do
			visit adverts_path
			find("#detaljnije-#{@advert.id}", text: "Pogledaj detaljnije..").click

			expect(current_path).to eq(advert_path(@advert))
		end
	end

	feature "show page" do
		background do
			@advert = FactoryGirl.create(:active_advert, user: user, comments_count: 0) 
		end

		scenario "should have full description" do
			visit advert_path(@advert)
			
			expect(page).to have_content "#{@advert.description}"
		end

		scenario "should have location,phone number and address" do
			visit advert_path(@advert)

			expect(page).to have_content "#{@advert.location}"
			expect(page).to have_content "#{@advert.phone_number}"
			expect(page).to have_content "#{@advert.address}"
		end
	end
end