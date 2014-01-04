FactoryGirl.define do
  factory :capsule do |f|
    f.title 'TDD Intro'
    f.description 'TDD Introduction for students'
    f.study_text 'Some study text with hyperlink: http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html'
    f.assignment_instructions 'Submit by tomorrow'
    f.guidelines_for_evaluators 'Ensure tests are clean and negative scenarios are covered'
  end
end