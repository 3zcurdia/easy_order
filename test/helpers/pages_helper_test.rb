require 'test_helper'

class PagesHelperTest < ActionView::TestCase
  test 'remove spaces in text' do
    result = whatsapp_url('5555555555', 'phrase with spaces')
    assert_equal 'https://wa.me/525555555555?text=phrase+with+spaces', result
  end
end
