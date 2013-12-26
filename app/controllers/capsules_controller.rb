class CapsulesController < ApplicationController
  def new
  end

  def create
    @capsule = Capsule.new(capsule_params)

    @capsule.save
    redirect_to @capsule
  end


  def show
    @capsule = Capsule.find(params[:id])
  end


  def index
    @capsules = Capsule.all
  end

  private
  def capsule_params
    params.require(:capsule).permit(:title, :description)
  end

end
