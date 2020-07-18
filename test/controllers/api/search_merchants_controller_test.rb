require 'test_helper'

class Api::SearchMerchantsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_search_merchants_url(name: 'test kitchen'), as: :json
    assert_response :success
  end
end
