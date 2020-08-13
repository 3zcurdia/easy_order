module Api
  class MenuController < BaseController
    def index
      merchant = Merchant.friendly.find(params[:merchant_id])
      @items = merchant.menu_items.includes(:section)
      authorize @items
    end
  end
end
