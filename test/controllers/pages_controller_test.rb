# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  def merchant
    @merchant ||= create(:merchant)
  end

  test "should render a valid page" do
    get page_path(merchant.slug)
    assert_response :success
  end

  test "shouldn't render an invalid page" do
    assert_raises ActiveRecord::RecordNotFound do
      get page_path("not-found")
    end
  end
end
