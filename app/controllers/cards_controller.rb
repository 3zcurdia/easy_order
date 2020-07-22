class CardsController < ApplicationController
  before_action :authenticate_user!
  layout 'page'

  def show
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end
end
