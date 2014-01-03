class Capsule < ActiveRecord::Base

  validates :title, length: { minimum: 3 }, uniqueness: true
  validates :description, length: { minimum: 5 }

end
