require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test 'must have name' do
    assert validate_presence_of(:name)
  end
end
