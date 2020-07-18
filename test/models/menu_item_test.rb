require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:price_cents)
    should validate_presence_of(:price_currency)
  end
end
