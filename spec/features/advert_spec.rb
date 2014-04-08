require 'spec_helper'

feature Advert do
	let(:user) { create :user}
	let!(:advert) { create(:active_advert, user: user) }
	
	def contacts
		expect(page).to have_content "#{advert.location}"
		expect(page).to have_content "#{advert.phone_number}"
		expect(page).to have_content "#{advert.address}"
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
			expect(page).to have_content "#{advert.description}"
		end

		scenario "should have location,phone number and address" do
			contacts
		end
	end
end