require 'spec_helper'

describe Session::RegistrationsController do
	before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @current_user ||= controller.current_user
	end

	describe '#update' do
		context 'successful update' do
      before(:each) do
        @current_user.stub(:update_attributes).and_return(true)
        put :update, user: { user_name: nil }
      end

      it 'redirects to the dashboard page' do
        expect(response).to redirect_to dashboard_path
      end

      it 'shows a success message' do
        expect(flash[:notice]).to eq 'Successfully updated'
      end
    end

    context 'unsuccessful update' do
      before(:each) do
        @current_user.stub(:update_attributes).and_return(false)
        put :update
      end

      it 'redirects to the dashboard page' do
        expect(response).to redirect_to dashboard_path
      end

      it 'shows an unsuccessful message' do
        expect(flash[:notice]).to eq 'Error'
      end
    end
	end
end