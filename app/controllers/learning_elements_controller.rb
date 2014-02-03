class LearningElementsController < ApplicationController

  before_action :get_learning_path

  def potential_capsules_for_path

    if @learning_path.capsules.count > 0
      @potential_capsules = Capsule.where('id not in (?)', @learning_path.capsules.map(&:id))
    else
      puts 'Returning all capsules'
      @potential_capsules = Capsule.all
      puts ("Number of capsules returned: #{@potential_capsules.size}")
    end

    # Don't render layout when request is AJAX
    render :layout => !request.xhr?
  end


  def add_capsules_to_path
    redirect_to @learning_path, alert: 'No updates were made to the path!' and return if (params[:learning_path].nil?)

    position = @learning_path.capsules.size + 1
    selected_capsules = Capsule.find params[:learning_path][:capsule_ids]

    selected_capsules.each{ |capsule|
      @learning_path.learning_path_elements.build(:capsule_id => capsule.id, :position => position)
      position = position + 1
    }

    if(@learning_path.save)
      redirect_to @learning_path, notice: 'Learning path was successfully updated.'
    else
      redirect_to @learning_path, alert: 'Learning path could not be updated!'
    end

  end

  private

      def get_learning_path
        @learning_path = LearningPath.find(params[:path_id])
      end

end