# frozen_string_literal: true

class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant
  before_action :set_menu_item, only: %i[edit update destroy toggle_availability]

  def index
    authorize(MenuItem)
    @menu_items = MenuQuery.new(scope: @merchant.menu).items_by_section(params[:section_id])
    @section_id = (params[:section_id].presence || @merchant.menu.sections.first&.id).to_i
  end

  def show; end

  def new
    @menu_item = authorize(@merchant.menu.items.build(section_id: params[:section_id]))
  end

  def edit; end

  def create
    @menu_item = authorize(MenuItem.new(menu_item_params))
    @menu_item.menu = @merchant.menu
    @menu_item.available = true

    respond_to do |format|
      if @menu_item.save
        format.turbo_stream
        format.html { redirect_to merchant_menu_items_path, notice: "El producto se creó correctamente." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to merchant_menu_items_path, notice: "El producto se actualizó correctamente." }
        format.json { render json: @menu_item }
      end
    else
      respond_to do |format|
        format.turbo_stream
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :bad_request }
      end
    end
  end

  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to merchant_menu_items_path, notice: "El producto se eliminó correctamente." }
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
    state = @menu_item.available ? "habilito" : "deshabilito"
    redirect_to @merchant, notice: "El producto se #{state} correctamente."
  end

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end

  def set_menu_item
    @menu_item = authorize(@merchant.menu.items.find(params[:id]))
  end

  def menu_item_params
    permitted_attributes(MenuItem)
  end

  def sorted_params
    params.require(:sorted).permit(menu_items: %i[id menu_id position])
  end
end
