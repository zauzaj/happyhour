require 'spec_helper'

describe Session::RegistrationsController do
	before :each do
		@current_user = double('user', id: 1)
    request.env['warden'].stub :authenticate! => @current_user
    controller.stub :current_user => @current_user
    request.env['devise.mapping'] = Devise.mappings[:user]
	end

	describe '#update' do
		context 'successful update' do
      before(:each) do
        @current_user.stub(:update_attributes).and_return(true)
        put :update, id: @current_user.id, user: { username: 'biske' }
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
        put :update, user: { email: '' }
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