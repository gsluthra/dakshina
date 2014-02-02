class LearningPath < ActiveRecord::Base
  validates :name, length: { minimum: 2 }, uniqueness: true

  has_many :learning_path_elements, ->{order (:position)}
  has_many :capsules, :through => :learning_path_elements

end
