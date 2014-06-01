require 'spec_helper'

describe Settlement do
	context "#associations" do
		
		it "should respond to adverts" do
			expect(subject).to respond_to(:adverts)
		end
	  
	  it "should respond to subscribes" do
	  	expect(subject).to respond_to(:subscribes)
	  end
	end



	
end