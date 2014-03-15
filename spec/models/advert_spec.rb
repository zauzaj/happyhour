require 'spec_helper'

describe "Advert" do
	let!(:active_advert) do
		create(:active_advert)
	end

	it "valid advert" do
		expect(advert).to be_valid
	end

	it "without title" do
	 	advert.title = nil
	 	expect(advert).to have(1).errors_on(:title)
	end

	it "without description" do
		advert.description = nil
		expect(advert).to have(2).errors_on(:description)  	
	end  

	it "invalid length" do
		advert.description = "a" * 201
		expect(advert).to have(1).errors_on(:description)
	end

	it "without address" do
		advert.address = nil
		expect(advert).to have(1).errors_on(:address)  	
	end

	it "without location" do
		advert.location = nil
		expect(advert).to have(1).errors_on(:location)  	
	end

	context '.active' do
		it 'returns only active adverts' do
			create(:inactive_advert)

			expect(Advert.active.count).to eq 1
		end
	end
end