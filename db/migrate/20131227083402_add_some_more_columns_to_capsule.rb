class AddSomeMoreColumnsToCapsule < ActiveRecord::Migration
  def change
    add_column :capsules, :study_text, :text
    add_column :capsules, :assignment_instructions, :text
    add_column :capsules, :guidelines_for_evaluators, :text
  end
end
