require 'spec_helper'


describe Capsule do

  it 'has a valid factory' do
    create(:capsule).should be_valid
  end

  it 'is invalid if title is not passed' do
    build(:capsule, title: nil).should_not be_valid
  end

  it 'is invalid if description is not passed' do
    build(:capsule, description: nil).should_not be_valid
  end

  it 'is invalid if title is less than 3 characters' do
    build(:capsule, title: 'AA').should_not be_valid
  end

  it 'is invalid if description is less than 5 characters' do
    build(:capsule, description: 'AAAA').should_not be_valid
  end

  it 'is valid if description has 5 characters' do
    build(:capsule, description: 'AAAAA').should be_valid
  end

  it 'is invalid if title already exisits on another capsule' do
    some_title = 'TDD'
    create(:capsule, title: some_title).should be_valid
    build(:capsule, title: some_title).should_not be_valid
  end

end