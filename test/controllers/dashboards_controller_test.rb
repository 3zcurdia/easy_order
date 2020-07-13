require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user, :merchant)
  end

  test 'should get show' do
    sign_in(user)
    get dashboard_url
    assert_response :success
  end
end
