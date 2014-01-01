require 'test_helper'

class CapsuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nil title should fail capsule save" do
      capsule = Capsule.new(:title=>nil, :description=>"Some capsule")
      assert_not capsule.save
  end

  test "nil description should fail capsule save" do
      capsule = Capsule.new(:title=>"Some title", :description=>nil)
      assert_not capsule.save
      assert capsule.invalid?
      assert_not_nil capsule.errors.messages
  end

  test "title less than 3 characters should fail capsule save" do
      capsule = Capsule.new(:title=>"AA", :description=>"Some capsule")
      assert_not capsule.save
  end

  test "descrption less than 5 characters should fail capsule save" do
      capsule = Capsule.new(:title=>"Some title", :description=>"AAAA")
      assert_not capsule.save
  end

  test "should save capsule if title and description are provided" do
      capsule = Capsule.new(:title=>"Some title", :description=>"Some description")
      assert capsule.save
      assert capsule.valid?
  end

end
