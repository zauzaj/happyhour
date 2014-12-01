require 'rails_helper'

feature Subscribe do
	let(:user) { create(:user) }
	before(:each) do
		@settlements = []
		2.times { @settlements << FactoryGirl.create(:settlement)}
		visit adverts_path
	end 
	
	scenario "#create successful" do
		
		fill_in 'inputEmail', with: "#{user.email}"
		select @settlements[0][:name], from: "subscribe_settlement_id"
		click_button "Posalji prijavu"
		expect(page).to have_content "Prijava je uspesno poslata. Hvala na interesovanju ."		
	end
end