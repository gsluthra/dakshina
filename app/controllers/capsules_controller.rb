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
    @capsule.destroy

    redirect_to capsules_path
  end


  private
  def capsule_params
    params.require(:capsule).permit(:title, :description)
  end

end
