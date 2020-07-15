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
    assert policy.show?
  end

  def test_create
    refute policy.create?
  end

  def test_update
    refute policy.update?
  end

  def test_destroy
    refute policy.destroy?
  end
end
