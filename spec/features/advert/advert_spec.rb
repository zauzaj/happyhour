require 'spec_helper'

feature Advert do
	let!(:advert) { create(:advert) }
	
	def contacts
		expect(page).to have_content "#{advert.location}"
		expect(page).to have_content "#{advert.phone_number}"
		expect(page).to have_content "#{advert.address}"
	end

	background do
		visit root_path
	end

	context "on index page" do
		background do
			visit root_path
		end

		it "should have title" do
			expect(page).to have_content "#{advert.title}"
			# save_and_open_page
		end

		it "should have image" do
			#TODO CREATE TEST FOR IMAGE
		end

		it "should have description" do
			expect(page).to have_content "#{advert.description.truncate 25}"
		end

		it "should have location,phone number and address" do
			contacts
		end

		it "should have link" do
			expect(page).to have_link "Pogledaj detaljnije.."
		end

		context "after clicking on link" do
			it "should redirect to single advert page" do
				click_link "Pogledaj detaljnije.."
				# save_and_open_page
				expect(current_path).to eq(advert_path(advert))
			end
		end
	end

	context "on show page" do
		background do 
			visit advert_path(advert)
		end

		it "should have full description" do
			save_and_open_page
			expect(page).to have_content "#{advert.description}"
		end

		it "should have location,phone number and address" do
			contacts
		end
		
	end
	


end