# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_user!
  layout 'page'

  def show
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end
end
