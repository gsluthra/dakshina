class LearningElementsController < ApplicationController

  def potential_capsules_for_path

    @learning_path = LearningPath.find(params[:path_id])
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
    puts 'add_capsules_to_path called!!'
    @learning_path = LearningPath.find(params[:path_id])
    capsules_hash = params[:learning_path]
    puts capsules_hash.class

    if capsules_hash.nil?
      redirect_to @learning_path, notice: 'No updates were made to the path!'
      return
    end

    selected_capsules = Capsule.find capsules_hash[:capsule_ids]
    position = @learning_path.capsules.size + 1

    selected_capsules.each{ |capsule|
      @learning_path.learning_path_elements.create(:capsule_id => capsule.id, :position => position)
      position = position + 1
    }

    redirect_to @learning_path, notice: 'Learning path was successfully updated.'

    end

end