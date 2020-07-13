class PagesController < ApplicationController
  layout 'landing_page'

  def show
    @merchant = Merchant.friendly.find(params[:id])
  end
end
