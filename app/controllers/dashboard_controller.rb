class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to merchants_path and return if current_user.admin?

    @merchant = current_user.merchants.first
    if @merchant.nil?
      redirect_to new_merchant_path and return
    else
      redirect_to @merchant
    end
  end
end
