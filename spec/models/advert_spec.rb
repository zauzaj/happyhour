require 'spec_helper'

describe "Advert" do
	let(:advert) do
		create(:advert)
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
		expect(advert).to have(1).errors_on(:description)  	
	end  

	it "invalid length" do
		advert.description = "a" * 201
		binding.pry
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


end