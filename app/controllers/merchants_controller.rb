class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: %i[show edit update destroy]

  def index
    @merchants = current_user.merchants
    authorize @merchants
  end

  def show
    authorize @merchant
  end

  def new
    @merchant = Merchant.new
    authorize @merchant
  end

  def edit
    authorize @merchant
  end

  def create
    @merchant = Merchant.new(merchant_params)
    @merchant.user = current_user
    authorize @merchant

    if @merchant.save
      redirect_to @merchant, notice: 'El Comercio fue creado con éxito.'
    else
      render :new
    end
  end

  def update
    authorize @merchant
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'El Comercio fue actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    authorize @merchant
    @merchant.destroy
    redirect_to merchants_url, notice: 'El Comercio fue eliminado con éxito.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_merchant
    @merchant = Merchant.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def merchant_params
    params.require(:merchant).permit(:name, :phone, :delivery)
  end
end
