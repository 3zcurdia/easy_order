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
    assert policy.index?
  end

  def test_show
    assert policy.show?
  end

  def test_create
    assert policy.create?
  end

  def test_update
    refute policy.update?
  end

  def test_destroy
    refute policy.destroy?
  end
end
