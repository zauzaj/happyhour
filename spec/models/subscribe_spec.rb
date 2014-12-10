require 'rails_helper'

describe Subscribe do
	
	context "#associations" do
	  
	  it "should responds to settlement" do
	  	expect(subject).to respond_to(:settlement)
	  end
	end

	context "create new subscription" do
		before(:each) do 
			@settlements = []
			2.times{ @settlements << FactoryGirl.create(:settlement) }
		end
	  context "#with valid attributes" do
	  	it "should create new subscribe" do
		  	expect{
		  	Subscribe.create!( 
											email: "foo@bar.com",
											settlement_id: @settlements[0].id
											)
		  	}.to change{Subscribe.all.count}.from(0).to(1)
	  	end
	  end
	end

end
