class Capsule < ActiveRecord::Base

  validates :title, length: { minimum: 3 }, uniqueness: true
  validates :description, length: { minimum: 5 }

  has_many :learning_path_elements
  has_many :learning_paths, :through => :learning_path_elements

end
