class Build::MenusController < ApplicationController
  before_action :validate_step

  def new
    @menu = merchant.menu
    if @menu.items.count.zero?
      4.times do
        @menu.items.build
      end
    end
  end

  def show
    @menu = merchant.menu
  end

  def update
    @menu = merchant.menu
    if @menu.update(menu_attributes)
      redirect_to build_preview_path
    else
      render :new
    end
  end

  private

  def menu_attributes
    params.require(:menu).permit(items_attributes: %i[id name price])
  end

  def validate_step
    return if session[:guest_merchant_id].present?

    redirect_to new_build_merchant_path
  end

  def merchant
    @merchant ||= Merchant.find(session[:guest_merchant_id])
  end
end
