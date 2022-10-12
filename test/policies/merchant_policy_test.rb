# frozen_string_literal: true

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
    assert_predicate policy, :index?
  end

  def test_show
    assert_predicate policy, :show?
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
