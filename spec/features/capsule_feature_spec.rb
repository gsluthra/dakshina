require 'spec_helper'

feature 'Capsules Feature' do

  TEST_CAPSULE_NAME = 'Feature_Testing Capsule'
  TEST_CAPSULE_DESCRIPTION = 'Feature_Testing Capsule Description'
  TEST_CAPSULE_STUDY_TEXT = 'Some dummy study material'
  TEST_CAPSULE_ASSIGNMENT_INSTRUCTION = 'Tough Assignment'
  TEST_CAPSULE_EVALUATOR_GUIDELINES = 'Be strict!'


  scenario 'Add a new capsule and displays the capsule in view mode' do

    visit '/capsules/new'

    expect{
      fill_in 'Title', :with => TEST_CAPSULE_NAME
      fill_in 'Description', :with => TEST_CAPSULE_DESCRIPTION
      fill_in 'capsule_study_text', :with => TEST_CAPSULE_STUDY_TEXT
      fill_in 'capsule_assignment_instructions', :with => TEST_CAPSULE_ASSIGNMENT_INSTRUCTION
      fill_in 'capsule_guidelines_for_evaluators', :with => TEST_CAPSULE_EVALUATOR_GUIDELINES
      click_button 'Save Capsule'
    }.to change(Capsule,:count).by(1)

    expect(page).to have_content TEST_CAPSULE_NAME
    expect(page).to have_content TEST_CAPSULE_DESCRIPTION
    expect(page).to have_content TEST_CAPSULE_STUDY_TEXT
    expect(page).to have_content TEST_CAPSULE_ASSIGNMENT_INSTRUCTION
    expect(page).to have_content TEST_CAPSULE_EVALUATOR_GUIDELINES
    expect(page).to have_link 'Edit'

  end

end