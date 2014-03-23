require 'spec_helper'

feature Advert do
	let(:user) { create :user}
	let!(:advert) { create(:active_advert, user: user) }
	def contacts
		expect(page).to have_content "#{advert.location}"
		expect(page).to have_content "#{advert.phone_number}"
		expect(page).to have_content "#{advert.address}"
	end

	# background do
	# 	visit root_path
	# end

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
				save_and_open_page
			end
		end
	end

	context "on show page" do
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

		context "comments for commentable advert" do
			it "should have five comments" do
				expect(page.all('#table-comments > .comment-panel').size).to eq 5
			end
			it "should have one more comment" do
				expect {click_button "Post Comment"}.to change(Comment, :count).by 1 	
			end	
		end
		
	end
	


end