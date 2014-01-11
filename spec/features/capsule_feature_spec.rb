require 'spec_helper'

feature 'Capsules Feature' do

  let(:capsuleHash) { attributes_for(:tdd_capsule) }
  let(:capsule_form) { CapsuleCreateForm.new }
  let(:capsule_view_page) { CapsuleViewPage.new }
  let(:capsule_edit_page) { CapsuleEditPage.new }
  let(:new_description) {'Updated Description'}
  let(:new_study_text) {'Some new study text'}


  scenario 'Add a new capsule and displays the capsule in view mode, then edit it' do

    visit '/capsules/new'

    expect {
      capsule_form.submit_form(capsuleHash)
    }.to change(Capsule, :count).by(1)

    capsule_view_page.validate_on_page
    capsule_view_page.validate_capsule_data(capsuleHash)
    capsule_view_page.click_on_edit


    capsule_edit_page.update_capsule({:description => new_description,
                                      :study_text => new_study_text})

    capsule_view_page.validate_on_page

    capsuleHash[:description] = new_description
    capsuleHash[:study_text] = new_study_text
    capsule_view_page.validate_capsule_data(capsuleHash)

  end

end