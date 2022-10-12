# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def subject
    @subject ||= build_stubbed(:user)
  end

  test "must be valid" do
    assert_predicate subject, :valid?
  end

  test "should create guest user" do
    user = User.create_guest
    assert_predicate user, :persisted?
    assert_equal "guest", user.role
  end

  test "should be guest as default role" do
    assert_equal "guest", subject.role
  end
end
