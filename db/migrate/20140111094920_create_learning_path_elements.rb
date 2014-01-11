class CreateLearningPathElements < ActiveRecord::Migration
  def change
    create_table :learning_path_elements do |t|
      t.integer :learning_path_id
      t.integer :capsule_id
      t.integer :position

      t.timestamps
    end
  end
end
