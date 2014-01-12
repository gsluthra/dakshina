class CreateUniqueIndexConstraintForLearningPathCapsule < ActiveRecord::Migration
  def change
    add_index(:learning_path_elements, [:learning_path_id, :capsule_id], :unique => true, :name => 'Unique_Capsule_In_Path_Index')
    add_index(:learning_path_elements, [:learning_path_id, :position], :unique => true, :name => 'Unique_Position_In_Path_Index')
  end
end
