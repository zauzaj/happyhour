require 'spec_helper'

describe "Advert" do
	let!(:active_advert) do
		create(:active_advert)
	end

	it "testing associations" do
		active_advert.should respond_to(:comments)
		active_advert.should respond_to(:user)
		active_advert.should respond_to(:category)
	end

	it "valid advert" do
		expect(active_advert).to be_valid
	end

	it "without title" do
	 	active_advert.title = nil
	 	expect(active_advert).to have(1).errors_on(:title)
	end

	it "without description" do
		active_advert.description = nil
		expect(active_advert).to have(2).errors_on(:description)  	
	end  

	it "invalid length" do
		active_advert.description = "a" * 201
		expect(active_advert).to have(1).errors_on(:description)
	end

	it "without address" do
		active_advert.address = nil
		expect(active_advert).to have(1).errors_on(:address)  	
	end

	it "without location" do
		active_advert.location = nil
		expect(active_advert).to have(1).errors_on(:location)  	
	end

	context '.active' do
		it 'returns only active adverts' do
			create(:inactive_advert)

			expect(Advert.active.count).to eq 1
		end
	end
end