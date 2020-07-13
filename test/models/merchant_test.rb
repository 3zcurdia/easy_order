require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:slug)
  end

  test 'must generate a valid slug' do
    merchant = create(:merchant, name: 'La cocina de mamá')
    assert_equal 'la-cocina-de-mama', merchant.slug
  end
end
