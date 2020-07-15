class Build::PreviewsController < ApplicationController
  before_action :validate_step

  def show
    @merchant = Merchant.includes(menu: :items).find(session[:guest_merchant_id])
  end

  private

  def validate_step
    return if session[:guest_merchant_id].present?

    redirect_to new_build_merchant_path
  end
end
