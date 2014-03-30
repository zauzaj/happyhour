require 'spec_helper'

feature "manage comments" do
  before(:all) do
    @advert = FactoryGirl.create(:active_advert)
    visit advert_path(@advert)
    fill_in "comment_owner", with: ""
    fill_in "comment_content", with: "dobar izlazak"
    click_button "Post Comment"
  end
  
  scenario "add comment" do
    visit advert_path(@advert)
    expect(page).to have_content("dobar izlazak")
  end 
  
  scenario "switch comment owner" do 
    visit advert_path(@advert)
    expect(page).to have_content("Anoniman korisnik")
  end
end