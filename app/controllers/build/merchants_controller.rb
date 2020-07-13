class Build::MerchantsController < ApplicationController
  def new
    @merchant = Merchant.new(user: current_or_guest_user)
  end
end
