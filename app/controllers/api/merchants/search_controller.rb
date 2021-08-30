# frozen_string_literal: true

module Api
  module Merchants
    class SearchController < BaseController
      def index
        render json: { exists: Merchant.slug_exists?(name) }
      end

      private

      def name
        params.require(:name)
      end
    end
  end
end
