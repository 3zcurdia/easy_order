# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user, :merchant)
  end

  setup do
    sign_in(user)
  end

  test 'should redirect to show' do
    create(:merchant, user: user)
    get dashboard_url
    assert_response :redirect
  end

  test 'should render a succesfull response' do
    merchant = create(:merchant, user: user)
    get merchant_path(merchant)
    assert_response :success
  end
end
