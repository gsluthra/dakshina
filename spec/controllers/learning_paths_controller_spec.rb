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



end
