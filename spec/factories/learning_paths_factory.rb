# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :learning_path do |l|
    l.name 'Dev Track'
    l.description 'Dev Track Description for Rockstar developers'
    l.objective 'To get ready for live project development'
  end

  factory :dev_track, parent: :learning_path  do |l|
    l.name 'Dev Track'
  end

  factory :ba_track, parent: :learning_path  do |l|
    l.name 'BA Track'
    l.description 'BA Track for rockstar BAs'
    l.objective 'Ready for the real world projects'
  end

  factory :nil_name_track, parent: :learning_path  do |l|
    l.name nil
  end
end
