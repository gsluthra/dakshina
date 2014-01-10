class CapsuleCreateForm
  include Capybara::DSL

  def submit_form(capsule={})
    fill_in 'Title', :with => capsule[:title]
    fill_in 'Description', :with => capsule[:description]
    fill_in 'capsule_study_text', :with => capsule[:study_text]
    fill_in 'capsule_assignment_instructions', :with => capsule[:assignment_instructions]
    fill_in 'capsule_guidelines_for_evaluators', :with => capsule[:guidelines_for_evaluators]
    click_button 'Save Capsule'
  end

end
