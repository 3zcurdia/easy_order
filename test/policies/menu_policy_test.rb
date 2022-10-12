# frozen_string_literal: true

require 'test_helper'

class MenuPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user, :merchant)
  end

  def merchant
    @merchant ||= create(:merchant, user: user)
  end

  def menu
    @menu ||= create(:menu, merchant: merchant)
  end

  def policy
    @policy ||= MenuPolicy.new(user, menu)
  end

  def test_show
    assert_predicate policy, :show?
  end

  def test_create
    assert_not policy.create?
  end

  def test_update
    assert_not policy.update?
  end

  def test_destroy
    assert_not policy.destroy?
  end
end
