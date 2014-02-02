require 'spec_helper'

describe LearningPathsController do

  describe 'GET #index' do

    it 'populates an array of learning_paths' do
      learning_path1 = create(:dev_track)
      learning_path2 = create(:ba_track)
      get :index
      expect(assigns(:learning_paths)).to eq([learning_path1, learning_path2])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end

  end

  describe 'GET #show' do

    let(:dev_track) { create(:dev_track) }

    before :each do
      get :show, id: dev_track.id
    end

    it { expect(assigns(:learning_path)).to eq(dev_track) }
    it { expect(response).to render_template :show }

  end


  describe 'POST #create' do

    context 'with valid attributes' do

      it 'creates a new lerning path' do
        expect {
          post :create, learning_path: attributes_for(:dev_track)
        }.to change(LearningPath,:count).by(1)
      end

      it 'redirects to the #show page' do
        post :create, learning_path: attributes_for(:dev_track)
        expect(response).to redirect_to LearningPath.last
      end

    end


    context 'with invalid attributes' do

      it 'does not save the new learning path' do
        expect {
          post :create, learning_path: attributes_for(:nil_name_track)
        }.to_not change(LearningPath,:count)
      end

      it 're-renders the #new method' do
        post :create, learning_path: attributes_for(:nil_name_track)
        expect(response).to render_template :new
      end

    end


  end

  describe 'PUT #update' do

    let (:saved_path) {create(:dev_track)}

    context 'Valid attributes' do
      it 'changes the learning path attributes and redirects to updated learning path' do

        NEW_NAME = 'Updated Name'
        NEW_DESCRIPTION = 'Updated description'
        NEW_OBJECTIVE = 'New objective'

        put :update, id: saved_path.id,
            learning_path: attributes_for(:dev_track, name: NEW_NAME, description: NEW_DESCRIPTION, objective: NEW_OBJECTIVE)

        saved_path.reload
        expect(saved_path.name).to eq(NEW_NAME)
        expect(saved_path.description).to eq(NEW_DESCRIPTION)
        expect(saved_path.objective).to eq(NEW_OBJECTIVE)

        expect(response).to redirect_to saved_path

      end

    end

    context 'InValid attributes' do
      it 'does not update the path and re-renders the edit method' do

        put :update, id: saved_path.id,
            learning_path: attributes_for(:nil_name_track)

        saved_path.reload
        original_dev_path = build(:dev_track)
        expect(saved_path.name).to eq(original_dev_path.name)
        expect(saved_path.description).to eq(original_dev_path.description)
        expect(saved_path.objective).to eq(original_dev_path.objective)

        expect(response).to render_template :edit

      end

    end


  end





end
