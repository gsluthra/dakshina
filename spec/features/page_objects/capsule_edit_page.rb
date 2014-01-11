class CapsuleEditPage
  include Capybara::DSL

  def update_capsule(capsule={})
    fill_in 'Title', :with => capsule[:title] unless capsule[:title].nil?
    fill_in 'Description', :with => capsule[:description] unless capsule[:description].nil?
    fill_in 'capsule_study_text', :with => capsule[:study_text] unless capsule[:study_text].nil?
    fill_in 'capsule_assignment_instructions', :with => capsule[:assignment_instructions] unless capsule[:assignment_instructions].nil?
    fill_in 'capsule_guidelines_for_evaluators', :with => capsule[:guidelines_for_evaluators] unless capsule[:guidelines_for_evaluators].nil?
    click_button 'Save Capsule'
  end

end
