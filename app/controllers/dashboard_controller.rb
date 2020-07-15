class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @merchants = current_user.merchants
  end
end
