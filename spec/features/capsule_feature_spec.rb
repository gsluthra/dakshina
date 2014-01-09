require 'spec_helper'

feature 'Capsules Feature' do

  let(:capsuleHash) {attributes_for(:tdd_capsule)}

  scenario 'Add a new capsule and displays the capsule in view mode' do

    visit '/capsules/new'
    capsuleForm = CapsuleCreateForm.new

    expect{
      capsuleForm.submit_form(capsuleHash)
    }.to change(Capsule,:count).by(1)

    expect(page).to have_selector '#capsule-title-page'
    expect(page).to have_content capsuleHash[:title]
    expect(page).to have_content capsuleHash[:description]
    expect(page).to have_content capsuleHash[:study_text]
    expect(page).to have_content capsuleHash[:assignment_instructions]
    expect(page).to have_content capsuleHash[:guidelines_for_evaluators]
    expect(page).to have_link 'Edit'

  end

end