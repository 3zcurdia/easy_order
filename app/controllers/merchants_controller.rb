# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: %i[show edit update destroy]

  def index
    @merchants = authorize(policy_scope(Merchant).active.order(orders_count: :desc))
  end

  def show; end

  def new
    @merchant = authorize(Merchant.new)
  end

  def edit; end

  def create
    @merchant = authorize(Merchant.new(merchant_params))
    @merchant.user = current_user

    if @merchant.save
      redirect_to @merchant, notice: 'El Comercio fue creado con éxito.'
    else
      render :new
    end
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'El Comercio fue actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy
    redirect_to merchants_url, notice: 'El Comercio fue eliminado con éxito.'
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    elsif params[:id].present?
      redirect_to page_url(params[:id])
    else
      redirect_to user_session_path, alert: t('devise.failure.unauthenticated')
    end
  end

  private

  def set_merchant
    @merchant = authorize(Merchant.friendly.find(params[:id]))
  end

  def merchant_params
    permitted_attributes(Merchant)
  end
end
