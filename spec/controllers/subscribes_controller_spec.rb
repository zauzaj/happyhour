require 'spec_helper'

describe SubscribesController do
	let(:valid_attributes) { attributes_for(:subscribe) } 
	before :each do 
		@settlements = []
		2.times { @settlements << FactoryGirl.create(:settlement)}
		@subscribe = Subscribe.new
	end

	describe "POST create" do
		context "successful subscripton" do
			before(:each) do
				post :create, { subscribe: valid_attributes, settlement: @settlements[0] }
				@subscribe.stub(:save).and_return(true)
			end
			it "should redirect to root_path" do
				expect(response).to redirect_to(root_path)
			end
			
			it "should shows success message" do
				expect(flash[:notice]).to eq "Prijava je uspesno poslata. Hvala na interesovanju ." 
			end
		end

		context "unsuccessful subscripton" do
			it "should redirect to root_path " do
				post :create, subscribe: {email: nil, settlement: @settlements[0] }
				expect(response).to redirect_to(root_path)
			end
		
			it "should shows error message" do
				post :create, subscribe: {email: nil, settlement: @settlements[0] }
				expect(flash[:notice]).to eq "Prijava nije uspesno prosla. Molimo pokusajte ponovo" 
			end
		end
	end
end