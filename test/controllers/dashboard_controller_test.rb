require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user, :merchant)
  end

  test 'should get show' do
    create(:merchant, user: user)
    sign_in(user)
    get user_root_url
    assert_response :success
  end
end
