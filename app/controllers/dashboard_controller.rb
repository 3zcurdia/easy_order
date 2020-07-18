class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @merchant = current_user.merchants.first
    if @merchant.nil?
      redirect_to new_merchant_path and return
    end
  end
end
