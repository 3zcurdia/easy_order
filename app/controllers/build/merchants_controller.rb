class Build::MerchantsController < ApplicationController
  def new
    @merchant = Merchant.new(user: current_or_guest_user)
  end

  def show
    @merchant = Merchant.find(session[:guest_merchant_id])
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      @merchant.create_menu
      session[:guest_merchant_id] = @merchant.id
      redirect_to new_build_menu_path
    else
      render :new
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:user_id, :name)
  end
end
