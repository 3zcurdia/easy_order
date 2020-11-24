# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to merchants_path and return if current_user.admin?

    @merchant = current_user.merchants.first
    redirect_to new_merchant_path and return unless @merchant

    redirect_to @merchant
  end
end
