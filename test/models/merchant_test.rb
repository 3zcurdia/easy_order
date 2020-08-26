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
    # should validate_numericality_of(:phone)
  end

  test 'must generate a valid slug' do
    assert_equal 'pizza-plaza', merchant.slug
  end

  test 'must create menu after create' do
    assert Menu.where(merchant_id: merchant.id).exists?
  end

  test 'must cast to boolean string on delivery' do
    merchant.delivery = '1'
    assert merchant.delivery
  end

  test 'must pass false on delivery' do
    merchant.delivery = false
    refute merchant.delivery
  end
end
