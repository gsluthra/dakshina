require 'spec_helper'

describe LearningPath do
  it 'has a valid factory' do
    expect(create(:dev_track)).to be_valid
  end

  it 'has a valid factory with invalid learning path' do
    expect(build(:nil_name_track)).to_not be_valid
  end

  it 'is invalid if name is not passed' do
    expect(build(:dev_track, name: nil)).to_not be_valid
  end

  it 'is invalid if name already exists on another learning path' do
    some_title = 'QA Track'
    expect(create(:dev_track, name: some_title)).to be_valid
    expect(build(:dev_track, name: some_title)).to_not be_valid
  end
end
