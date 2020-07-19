require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_numericality_of(:phone)
  end

  test 'must generate a valid slug' do
    merchant = create(:merchant, name: 'La cocina de mamá')
    assert_equal 'la-cocina-de-mama', merchant.slug
  end

  test 'must create menu after create' do
    merchant = create(:merchant, user: user)
    assert Menu.where(merchant_id: merchant.id).exists?
  end
end
