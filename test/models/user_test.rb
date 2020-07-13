require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
  end

  test 'should create guest user' do
    user = User.create_guest
    assert user.persisted?
    assert_equal 'guest', user.role
  end

  test 'should be guest as default role' do
    assert_equal 'guest', build(:user).role
  end
end
