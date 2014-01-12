class LearningPathElement < ActiveRecord::Base
  belongs_to :learning_path
  belongs_to :capsule

  validates_uniqueness_of :position, :scope => [:learning_path]
end
