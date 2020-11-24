# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user, :merchant)
  end

  test 'should render show' do
    create(:merchant, user: user)
    sign_in(user)
    get user_root_url
    assert_response :redirect
  end
end
