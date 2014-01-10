require 'spec_helper'

feature 'Capsules Feature' do

  let(:capsuleHash) { attributes_for(:tdd_capsule) }
  let(:capsuleForm) { CapsuleCreateForm.new }
  let(:capsuleViewPage) { CapsuleViewPage.new }

  scenario 'Add a new capsule and displays the capsule in view mode' do

    visit '/capsules/new'

    expect {
      capsuleForm.submit_form(capsuleHash)
    }.to change(Capsule, :count).by(1)

    capsuleViewPage.validate_on_page
    capsuleViewPage.validate_capsule_data(capsuleHash)

  end

end