# frozen_string_literal: true

require 'test_helper'

class OrderPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user, :merchant)
  end

  def merchant
    @merchant ||= create(:merchant, user: user)
  end

  def order
    @order ||= create(:order, merchant: merchant)
  end

  def policy
    @policy ||= OrderPolicy.new(user, order)
  end

  def test_index
    assert_predicate policy, :index?
  end

  def test_show
    assert_predicate policy, :show?
  end

  def test_create
    assert_predicate policy, :create?
  end

  def test_update
    assert_not policy.update?
  end

  def test_destroy
    assert_not policy.destroy?
  end
end
