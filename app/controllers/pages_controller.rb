# frozen_string_literal: true

class PagesController < ApplicationController
  layout "page"

  def show
    @merchant = Merchant.friendly.find(params[:id] || request.subdomain)
    @order = Order.new(merchant: @merchant)
    @menu_items = @merchant.menu_items
  end
end
