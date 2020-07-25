class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @merchant = current_user.merchants.first
    redirect_to new_merchant_path and return if @merchant.nil?
    @section_filter = @merchant.menu.sections.first.id
    @menu_items = @merchant.menu_items.where(section_id: @section_filter)
  end
end
