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


  def remove_capsule_from_path
    capsule_id_to_remove = params[:capsule_id].to_s
    position = -1
    deleted_successfully = false
    @learning_path.learning_path_elements.each { |element|
      if (element.capsule_id.equal? capsule_id_to_remove.to_i)
        position = element.position
        if element.destroy
          deleted_successfully = true
        end
      end
    }

    redirect_to @learning_path, alert: 'No updates were made to the path! Delete failed' and return unless deleted_successfully

    @learning_path.reload

    update_positions_for_remaining_capsules(position)

    redirect_to @learning_path, notice: 'Capsule removed from path!'
  end


  private

      def get_learning_path
        @learning_path = LearningPath.find(params[:id])
      end

      def update_positions_for_remaining_capsules(position)
        @learning_path.learning_path_elements.each { |element|
          current_position = element.position
          if current_position > position
            element.position = position
            position = position + 1
            element.save!
          end
        }
      end


end