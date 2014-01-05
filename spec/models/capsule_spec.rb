require 'spec_helper'


describe 'Capsule Model' do

  it 'has a valid factory' do
    expect(create(:tdd_capsule)).to be_valid
  end

  it 'is invalid if title is not passed' do
    expect(build(:tdd_capsule, title: nil)).to_not be_valid
  end

  it 'is invalid if description is not passed' do
    expect(build(:tdd_capsule, description: nil)).to_not be_valid
  end

  it 'is invalid if title is less than 3 characters' do
    expect(build(:tdd_capsule, title: 'AA')).to_not be_valid
  end

  it 'is invalid if description is less than 5 characters' do
    expect(build(:tdd_capsule, description: 'AAAA')).to_not be_valid
  end

  it 'is valid if description has 5 characters' do
    expect(build(:tdd_capsule, description: 'AAAAA')).to be_valid
  end

  it 'is invalid if title already exisits on another capsule' do
    some_title = 'TDD'
    expect(create(:tdd_capsule, title: some_title)).to be_valid
    expect(build(:tdd_capsule, title: some_title)).to_not be_valid
  end

end