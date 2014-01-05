require 'spec_helper'

describe CapsulesController do

  describe 'GET #index' do

    it 'populates an array of capsules' do
      capsule1 = create(:tdd_capsule)
      capsule2 = create(:tdd_capsule, title: 'SomeOtherTitle')
      get :index
      expect(assigns(:capsules)).to eq([capsule1, capsule2])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end

  end


  describe 'GET #show' do

    before :each do
      @tdd_capsule = create(:tdd_capsule)
    end

    it 'populates the requested capsule into a @capsule' do
      get :show, id: @tdd_capsule.id
      expect(assigns(:capsule)).to eq(@tdd_capsule)
    end


    it 'renders the #show view' do
      get :show, id: @tdd_capsule.id
      expect(response).to render_template :show
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
          expect(response).to redirect_to Capsule.last
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
          expect(response).to render_template :new
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
        expect(@saved_capsule.title).to eq(NEW_TITLE)
        expect(@saved_capsule.description).to eq(NEW_DESCRIPTION)
        expect(@saved_capsule.study_text).to eq(NEW_STUDY_TEXT)

        expect(response).to redirect_to @saved_capsule

      end

    end

    context 'InValid attributes' do
      it 'does not update the capsule and re-renders the edit method' do

        put :update, id: @saved_capsule.id,
            capsule: attributes_for(:nil_title_capsule)

        @saved_capsule.reload
        original_tdd_capsule = build(:tdd_capsule)
        expect(@saved_capsule.title).to eq(original_tdd_capsule.title)
        expect(@saved_capsule.description).to eq(original_tdd_capsule.description)
        expect(@saved_capsule.study_text).to eq(original_tdd_capsule.study_text)

        expect(response).to render_template :edit

      end

    end


  end


  describe 'DELETE #destroy' do
    before :each do
      @saved_capsule = create(:tdd_capsule)
    end

    it 'deletes the Capsule and redirects to capsule listing page' do
      expect {
        delete :destroy, id: @saved_capsule.id
      }.to change(Capsule, :count).by(-1)

      expect(response).to redirect_to capsules_url

    end

  end

end