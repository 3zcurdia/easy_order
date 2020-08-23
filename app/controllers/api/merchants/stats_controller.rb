module Api
  module Merchants
    class StatsController < BaseController
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
          total_orders: Order.total_sum
        }
      end

      def merchant_metrics
        {
          sections: merchant.sections.count,
          products: merchant.items.count,
          orders: merchant.orders_count,
          total_orders: merchant.orders.total_sum
        }
      end

      def merchant
        @merchant ||= Merchant.friendly.find(params[:merchant_id])
      end
    end
  end
end
