require 'spec_helper'

describe CommentsController do
	let(:valid_attributes_for_comment) { attributes_for(:comment) } 
	before :each do 
		@advert = FactoryGirl.create :active_advert
	end
	describe "POST create" do
		it "creates new Comment" do
			expect{
				post :create, advert_id: @advert.id, comment: valid_attributes_for_comment
			}.to change(Comment, :count).by 1			
		end
		it "should redirect to @advert" do
			post :create, advert_id: @advert.id, comment: valid_attributes_for_comment
			expect(response).to redirect_to(@advert) 
		end
	end



end