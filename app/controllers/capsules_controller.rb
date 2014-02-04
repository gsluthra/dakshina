class CapsulesController < ApplicationController
  def new
    @capsule = Capsule.new
  end

  def create
    @capsule = Capsule.new(capsule_params)

    if @capsule.save
      redirect_to @capsule
    else
      render 'new'
    end


  end


  def show
    @capsule = Capsule.find(params[:id])
  end


  def index
    @capsules = Capsule.all
  end


  def edit
    @capsule = Capsule.find(params[:id])
  end

  def update
    @capsule = Capsule.find(params[:id])

    if @capsule.update(capsule_params)
      redirect_to @capsule
    else
      render 'edit'
    end
  end


  def destroy
    @capsule = Capsule.find(params[:id])

    path_count = learning_paths_that_map_on_capsule @capsule.id

    if (path_count>0)
      redirect_to capsules_path, alert: "Cannot delete capsule #{@capsule.title} since it is being used in #{path_count} learning paths."
      return
    else
      @capsule.destroy
      redirect_to capsules_path, notice: 'Capsule deleted: '+ @capsule.title
    end

  end

  private
    def capsule_params
      params.require(:capsule).permit(:title, :description, :study_text, :assignment_instructions, :guidelines_for_evaluators)
    end

    def learning_paths_that_map_on_capsule(capsule_id)
      LearningPathElement.where(:capsule_id => capsule_id).count
    end


end
