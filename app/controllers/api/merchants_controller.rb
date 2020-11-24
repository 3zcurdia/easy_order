# frozen_string_literal: true

module Api
  class MerchantsController < BaseController
    def index
      @merchants = policy_scope(Merchant)
      authorize @merchants
    end

    def show
      @merchant = Merchant.friendly.find(params[:id])
      authorize @merchant
    end
  end
end
