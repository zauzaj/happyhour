require 'rails_helper'

describe Comment do
  it "saves anonimous instead of empty comment owner" do
    comment = FactoryGirl.create(:comment, owner: nil) 
    expect(comment.owner).to eq "Anoniman korisnik"
  end 
end
