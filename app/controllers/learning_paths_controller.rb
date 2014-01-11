class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: [:show, :edit, :update, :destroy]

  # GET /learning_paths
  def index
    @learning_paths = LearningPath.all
  end

  # GET /learning_paths/1
  def show
  end

  # GET /learning_paths/new
  def new
    @learning_path = LearningPath.new
  end

  # GET /learning_paths/1/edit
  def edit
  end

  # POST /learning_paths
  def create
    @learning_path = LearningPath.new(learning_path_params)

    if @learning_path.save
      redirect_to @learning_path, notice: 'Learning path was successfully created.'
    else
      render action: 'new'
    end

  end

  # PATCH/PUT /learning_paths/1
  def update
    if @learning_path.update(learning_path_params)
      redirect_to @learning_path, notice: 'Learning path was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /learning_paths/1
  def destroy
    @learning_path.destroy
    redirect_to learning_paths_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_path
      @learning_path = LearningPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_path_params
      params.require(:learning_path).permit(:name, :description, :objective)
    end
end
