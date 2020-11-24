# frozen_string_literal: true

module Api
  module Merchants
    class StatsController < BaseController
      before_action :authenticate_user!

      def index
        if params[:merchant_id].present?
          render json: merchant_metrics
        else
          render json: all_metrics
        end
      end

      private

      def all_metrics
        {
          merchants: Merchant.count,
          sections: Section.count,
          products: MenuItem.count,
          orders: Order.count,
          transactions: Order.total_sum
        }
      end

      def merchant_metrics
        {
          sections: merchant.sections.count,
          products: merchant.items.count,
          orders: merchant.orders_count,
          transactions: merchant.orders.current_month.total_sum
        }
      end

      def merchant
        @merchant ||= Merchant.friendly.find(params[:merchant_id])
      end
    end
  end
end
