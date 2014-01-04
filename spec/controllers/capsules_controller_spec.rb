require 'spec_helper'

describe CapsulesController do

  describe 'GET #index' do

    it 'populates an array of capsules' do
      capsule1 = create(:tdd_capsule)
      capsule2 = create(:tdd_capsule, title: 'SomeOtherTitle')
      get :index
      assigns(:capsules).should eq([capsule1, capsule2])
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end

  end


  describe 'GET #show' do

    before :each do
      @tdd_capsule = create(:tdd_capsule)
    end

    it 'populates the requested capsule into a @capsule' do
      get :show, id: @tdd_capsule.id
      assigns(:capsule).should eq(@tdd_capsule)
    end


    it 'renders the #show view' do
      get :show, id: @tdd_capsule.id
      response.should render_template :show
    end

  end



  describe 'POST #create' do

    context 'with valid attributes' do

        it 'creates a new capsule' do
          expect {
            post :create, capsule: attributes_for(:tdd_capsule)
          }.to change(Capsule,:count).by(1)
        end

        it 'redirects to the #show page' do
          post :create, capsule: attributes_for(:tdd_capsule)
          response.should redirect_to Capsule.last
        end

    end


    context 'with invalid attributes' do

        it 'does not save the new capsule' do
          expect {
            post :create, capsule: attributes_for(:nil_title_capsule)
          }.to_not change(Capsule,:count)
        end

        it 're-renders the #new method' do
          post :create, capsule: attributes_for(:nil_title_capsule)
          response.should render_template :new
        end

    end


  end

end