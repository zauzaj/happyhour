require 'spec_helper'

describe DashboardsController do

  describe "GET 'index'" do
  	let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
    	@request.env["devise.mapping"] = Devise.mappings[:user]
    	sign_in(user)
      get 'index'
      
      response.should be_success
    end
  end

end
