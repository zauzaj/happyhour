require 'spec_helper'

feature Advert do
	let(:user) { create :user}
	let!(:advert) { create(:active_advert, user: user) }
	
	def contacts
		expect(page).to have_content "#{advert.location}"
		expect(page).to have_content "#{advert.phone_number}"
		expect(page).to have_content "#{advert.address}"
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

	feature "index page" do
		scenario "expect page to have one advert" do
			visit adverts_path
			expect(page.all('#adverts > .col-lg-4').size).to eq 1
		end

		scenario "expect page to have one advert" do
			advert2 = create :active_advert, user: user
			visit adverts_path

			expect(page.all('#adverts > .col-lg-4').size).to eq 2
		end

		context "on advert click" do
			scenario "redirect to single advert page" do
				create :active_advert, user: user
				visit adverts_path
				find("#detaljnije-#{advert.id}", text: "Pogledaj detaljnije..").click

				expect(current_path).to eq(advert_path(advert))
			end
		end
	end

	feature "show page" do
		background do 
			visit advert_path(advert)
		end

		scenario "should have full description" do
			save_and_open_page
			expect(page).to have_content "#{advert.description}"
		end

		scenario "should have location,phone number and address" do
			contacts
		end
	end
end