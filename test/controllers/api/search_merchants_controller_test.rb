# frozen_string_literal: true

require "test_helper"

class Api::SearchMerchantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_merchants_search_index_url(name: "test kitchen"), as: :json
    assert_response :success
  end
end
