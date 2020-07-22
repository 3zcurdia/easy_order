require 'test_helper'

class MerchantPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user, :merchant)
  end

  def merchant
    @merchant ||= create(:merchant, user: user)
  end

  def policy
    @policy ||= MerchantPolicy.new(user, merchant)
  end

  def test_index
    refute policy.index?
  end

  def test_show
    assert policy.show?
  end

  def test_create
    assert policy.create?
  end

  def test_update
    assert policy.update?
  end

  def test_destroy
    assert policy.destroy?
  end
end
