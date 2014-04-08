require 'spec_helper'

feature "Advert comments" do
  background do
    @advert = FactoryGirl.create(:active_advert)
  end


  feature 'add comment' do
    background do
      visit advert_path(@advert)
      fill_in "comment_owner", with: ""
      fill_in "comment_content", with: "dobar izlazak"
      click_button "Post Comment"
    end

    scenario 'adds comment to advert' do
      expect(page).to have_content("dobar izlazak")
    end

    scenario "populates 'Anoniman korisnik' for empty owner" do
      expect(page).to have_content("Anoniman korisnik")
    end
  end

  
  feature 'show comments' do
    scenario "shows one comment" do
      FactoryGirl.create(:comment, advert: @advert)
      visit advert_path(@advert)
      
      expect(page).to have_content("Odlican provod")
    end

    scenario "shows five comments" do
      5.times do
        FactoryGirl.create(:comment, advert: @advert)
      end
      visit advert_path(@advert)

      expect(page.all('#table-comments > .comment-panel').size).to eq 5
    end
  end
end