# frozen_string_literal: true

require "test_helper"

class MenuItemPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user, :merchant)
  end

  def merchant
    @merchant ||= create(:merchant, user: user)
  end

  def menu
    @menu ||= create(:menu, merchant: merchant)
  end

  def menu_item
    @menu_item ||= create(:menu_item, menu: menu)
  end

  def policy
    @policy ||= MenuItemPolicy.new(user, menu_item)
  end

  def test_show
    assert_not policy.show?
  end

  def test_create
    assert_predicate policy, :create?
  end

  def test_update
    assert_predicate policy, :update?
  end

  def test_destroy
    assert_predicate policy, :destroy?
  end
end
