class CapsuleCreateForm
  include Capybara::DSL

  def submit_form(options={})
    fill_in 'Title', :with => options[:title]
    fill_in 'Description', :with => options[:description]
    fill_in 'capsule_study_text', :with => options[:study_text]
    fill_in 'capsule_assignment_instructions', :with => options[:assignment_instructions]
    fill_in 'capsule_guidelines_for_evaluators', :with => options[:guidelines_for_evaluators]
    click_button 'Save Capsule'
  end

end
