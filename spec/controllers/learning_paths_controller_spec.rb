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




end
