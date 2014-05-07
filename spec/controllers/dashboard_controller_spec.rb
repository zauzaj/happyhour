require 'spec_helper'

describe DashboardsController do

  describe "GET 'index'" do
  	let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
    	@request.env["devise.mapping"] = Devise.mappings[:user]
    	sign_in(user)
      get 'index'
      
      expect(response).to render_template :index
    end

    it "assigns all adverts by current_user as @all_my_adverts" do
    	advert = FactoryGirl.create(:active_advert, user: user)
    	get :index
    	expect(assigns(:all_my_adverts)).to eq([advert])
    end
  end

end
