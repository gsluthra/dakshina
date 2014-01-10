require 'spec_helper'

class CapsuleViewPage
  include Capybara::DSL
  include RSpec::Matchers

  def validate_on_page
    expect(page).to have_selector('#capsule-title-page')
    expect(page).to have_link('Edit')
  end


  def validate_capsule_data (capsule={})
    expect(page).to have_content capsule[:title]
    expect(page).to have_content capsule[:description]
    expect(page).to have_content capsule[:study_text]
    expect(page).to have_content capsule[:assignment_instructions]
    expect(page).to have_content capsule[:guidelines_for_evaluators]
  end

end

