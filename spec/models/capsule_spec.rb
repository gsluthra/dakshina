require 'spec_helper'


describe Capsule do

  it 'has a valid factory' do
    create(:tdd_capsule).should be_valid
  end

  it 'is invalid if title is not passed' do
    build(:tdd_capsule, title: nil).should_not be_valid
  end

  it 'is invalid if description is not passed' do
    build(:tdd_capsule, description: nil).should_not be_valid
  end

  it 'is invalid if title is less than 3 characters' do
    build(:tdd_capsule, title: 'AA').should_not be_valid
  end

  it 'is invalid if description is less than 5 characters' do
    build(:tdd_capsule, description: 'AAAA').should_not be_valid
  end

  it 'is valid if description has 5 characters' do
    build(:tdd_capsule, description: 'AAAAA').should be_valid
  end

  it 'is invalid if title already exisits on another capsule' do
    some_title = 'TDD'
    create(:tdd_capsule, title: some_title).should be_valid
    build(:tdd_capsule, title: some_title).should_not be_valid
  end

end