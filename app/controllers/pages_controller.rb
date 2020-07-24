class PagesController < ApplicationController
  layout 'page'

  def show
    @merchant = Merchant.includes(:keywords).friendly.find(params[:id])
    @menu_items = @merchant.menu_items
  end
end
