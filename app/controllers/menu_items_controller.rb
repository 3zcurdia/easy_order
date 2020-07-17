class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant
  before_action :set_menu_item, only: %i[show edit update destroy]

  def new
    @menu_item = menu.items.build
    authorize @menu_item
  end

  def edit
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.menu = menu
    authorize @menu_item

    if @menu_item.save
      redirect_to @merchant, notice: 'El elemento del menú se creó correctamente.'
    else
      render :new
    end
  end

  def update
    authorize @menu_item
    if @menu_item.update(menu_item_params)
      redirect_to @merchant, notice: 'El elemento del menú se actualizó correctamente.'
    else
      render :edit
    end
  end

  def destroy
    authorize @menu_item
    @menu_item.destroy
    redirect_to @merchant, notice: 'El elemento del menú se eliminó correctamente.'
  end

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end

  def menu
    @merchant.menu
  end

  def set_menu_item
    @menu_item = menu.items.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end
end
