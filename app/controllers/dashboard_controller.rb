class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @merchant = current_user.merchants.first
    redirect_to new_merchant_path and return if @merchant.nil?
  end
end
