class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant
  before_action :set_menu_item, except: %i[new create sort]

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
    @menu_item.available = true
    authorize @menu_item

    if @menu_item.save
      redirect_to @merchant, notice: 'El producto se creó correctamente.'
    else
      render :new
    end
  end

  def update
    authorize @menu_item
    if @menu_item.update(menu_item_params)
      respond_to do |format|
        format.html { redirect_to @merchant, notice: 'El producto se actualizó correctamente.' }
        format.json { render json: @menu_item }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :bad_request }
      end
    end
  end

  def sort
    MenuItem.transaction do
      sorted_params[:menu_items].each do |item|
        MenuItem.where(id: item[:id]).update(position: item[:position])
      end
    end
    render json: {}, status: :ok
  end

  def toggle_availability
    @menu_item.toggle_availability
    state = @menu_item.available ? 'habilito' : 'deshabilito'
    redirect_to @merchant, notice: "El producto se #{state} correctamente."
  end

  def destroy
    authorize @menu_item
    @menu_item.destroy
    redirect_to @merchant, notice: 'El producto se eliminó correctamente.'
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
    params.require(:menu_item).permit(:position, :name, :description, :price, :photo, :section_id, :unit)
  end

  def sorted_params
    params.require(:sorted).permit(menu_items: %i[id menu_id position])
  end
end
