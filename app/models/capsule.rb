class Capsule < ActiveRecord::Base

  validates :title, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }

end
