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




  describe 'PUT #update' do

    before :each do
      @saved_capsule = create(:tdd_capsule)
    end

    context 'Valid attributes' do
      it 'changes the capsules attributes and redirects to updated capsule' do

        NEW_TITLE = 'Updated title'
        NEW_DESCRIPTION = 'Updated description'
        NEW_STUDY_TEXT = 'New Study Text'

        put :update, id: @saved_capsule.id,
            capsule: attributes_for(:tdd_capsule, title: NEW_TITLE, description: NEW_DESCRIPTION, study_text: NEW_STUDY_TEXT)

        @saved_capsule.reload
        @saved_capsule.title.should eq(NEW_TITLE)
        @saved_capsule.description.should eq(NEW_DESCRIPTION)
        @saved_capsule.study_text.should eq(NEW_STUDY_TEXT)

        response.should redirect_to @saved_capsule

      end

    end

    context 'InValid attributes' do
      it 'does not update the capsule and re-renders the edit method' do

        put :update, id: @saved_capsule.id,
            capsule: attributes_for(:nil_title_capsule)

        @saved_capsule.reload
        original_tdd_capsule = build(:tdd_capsule)
        @saved_capsule.title.should eq(original_tdd_capsule.title)
        @saved_capsule.description.should eq(original_tdd_capsule.description)
        @saved_capsule.study_text.should eq(original_tdd_capsule.study_text)

        response.should render_template :edit

      end

    end


  end

end