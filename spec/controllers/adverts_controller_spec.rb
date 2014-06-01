require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AdvertsController do

  # This should return the minimal set of attributes required to create a valid
  # Advert. As you add validations to Advert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:active_advert) }
  let(:user) { FactoryGirl.create(:user) }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdvertsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  describe "GET index" do
    it "assigns active adverts as @adverts" do
      active_advert = FactoryGirl.create :active_advert
      inactive_advert = FactoryGirl.create :inactive_advert
      get :index
      expect(assigns(:adverts)).to eq([active_advert])
    end

    it "truc trac" do
      active_advert = FactoryGirl.create :active_advert
      
      expect(Advert).to receive :active
      
      get :index
    end

    it "assigns all settlements as @settlements" do
      settlement = FactoryGirl.create(:settlement)
      get :index
      expect(assigns(:settlements)).to eq([settlement])
    end
  end

  describe "GET show" do
    it "assigns the requested advert as @advert" do
      active_advert = FactoryGirl.create :active_advert
      get :show, { :id => active_advert.to_param }

      expect(assigns(:advert)).to eq(active_advert)
    end
  end

  describe "GET new" do
    it "assigns a new advert as @advert" do
      get :new
      
      expect(assigns(:advert)).to be_a_new(Advert)
    end
  end

  describe "GET edit" do
    it "assigns the requested advert as @advert" do
      advert = Advert.create! valid_attributes
      get :edit, {:id => advert.to_param}
      expect(assigns(:advert)).to eq(advert)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Advert" do
        expect {
          post :create, {:advert => valid_attributes}
        }.to change(Advert, :count).by(1)
      end

      it "assigns a newly created advert as @advert" do
        post :create, {:advert => valid_attributes}
        expect(assigns(:advert)).to be_a(Advert)
        expect(assigns(:advert)).to be_persisted
      end

      it "redirects to the created advert" do
        post :create, {:advert => valid_attributes}
        expect(response).to redirect_to(Advert.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved advert as @advert" do
        # Trigger the behavior that occurs when invalid params are submitted
        Advert.any_instance.stub(:save).and_return(false)
        post :create, {:advert => {  }}
        expect(assigns(:advert)).to be_a_new(Advert)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Advert.any_instance.stub(:save).and_return(false)
        post :create, {:advert => {  }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested advert" do
        advert = Advert.create! valid_attributes
        # Assuming there are no other adverts in the database, this
        # specifies that the Advert created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Advert).to receive(:update).with({ title: 'bla truc' })
        put :update, {:id => advert.to_param, :advert => { title: 'bla truc' }}
      end

      it "assigns the requested advert as @advert" do
        advert = Advert.create! valid_attributes
        put :update, {:id => advert.to_param, :advert => valid_attributes}
        expect(assigns(:advert)).to eq(advert)
      end

      it "redirects to the advert" do
        advert = Advert.create! valid_attributes
        put :update, {:id => advert.to_param, :advert => valid_attributes}
        expect(response).to redirect_to(advert)
      end
    end

    describe "with invalid params" do
      it "assigns the advert as @advert" do
        advert = Advert.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Advert.any_instance.stub(:save).and_return(false)
        put :update, {:id => advert.to_param, :advert => {  }}
        expect(assigns(:advert)).to eq(advert)
      end

      it "re-renders the 'edit' template" do
        advert = Advert.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Advert.any_instance.stub(:save).and_return(false)
        put :update, {:id => advert.to_param, :advert => {  }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested advert" do
      advert = FactoryGirl.create(:active_advert, user: user, comments_count: 0)
      expect {
        delete :destroy, {:id => advert.to_param}
      }.to change(Advert, :count).by(-1)
    end

    it "redirects to the adverts list" do
      advert = FactoryGirl.create(:active_advert, user: user, comments_count: 0)
      delete :destroy, {:id => advert.to_param}
      expect(response).to redirect_to(adverts_url)
    end
  end
end

