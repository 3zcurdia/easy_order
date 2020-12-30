# frozen_string_literal: true

require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user)
  end

  def merchant
    @merchant ||= create(:merchant, user: user)
  end

  context 'validations' do
    should validate_presence_of(:name)
  end

  test 'must generate a valid slug' do
    assert_equal 'pizza-plaza', merchant.slug
  end

  test 'must create menu after create' do
    assert Menu.exists?(merchant_id: merchant.id)
  end

  test 'must cast to boolean string on delivery' do
    merchant.delivery = '1'
    assert merchant.delivery
  end

  test 'must pass false on delivery' do
    merchant.delivery = false
    assert_not merchant.delivery
  end
end
