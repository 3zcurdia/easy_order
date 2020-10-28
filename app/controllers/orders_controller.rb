class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_merchant

  def index
    @orders = policy_scope(Order)
    authorize @orders
  end

  def show
    @order = @merchant.orders.find(params[:id])
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.merchant = @merchant
    authorize @order

    @order.save
    redirect_to whatsapp_url(@merchant, @order)
  end

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end

  def order_params
    params.require(:order).permit(items_attributes: %i[menu_item_id quantity unit])
  end

  def whatsapp_url(merchant, order)
    query = URI.encode_www_form(text: order.message)
    URI.parse("https://wa.me/#{merchant.phone}?#{query}").to_s
  end
end
