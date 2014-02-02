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


end
