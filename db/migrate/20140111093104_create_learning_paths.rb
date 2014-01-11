class CreateLearningPaths < ActiveRecord::Migration
  def change
    create_table :learning_paths do |t|
      t.string :name
      t.text :description
      t.text :objective

      t.timestamps
    end
  end
end
