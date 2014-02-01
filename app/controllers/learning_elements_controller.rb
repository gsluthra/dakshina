class LearningElementsController < ApplicationController

  def potential_capsules_for_path

    learning_path = LearningPath.find(params[:path_id])
    if learning_path.capsules.count > 0
      @potential_capsules = Capsule.where('id not in (?)', learning_path.capsules.map(&:path_id))
    else
      puts 'Returning all capsules'
      @potential_capsules = Capsule.all
      puts ("Number of capsules returned: #{@potential_capsules.size}")
    end

    # Don't render layout when request is AJAX
    render :layout => !request.xhr?
  end

end