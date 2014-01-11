class LearningPathElement < ActiveRecord::Base
  belongs_to :learning_path
  belongs_to :capsule
end
