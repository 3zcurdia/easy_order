# frozen_string_literal: true

module Api
  module Merchants
    class SearchController < BaseController
      def index
        render json: { available: available?(name) }
      end

      def available?(name)
        !Merchant.with_slug(name).exists?
      end

      private

      def name
        params.require(:name)
      end
    end
  end
end
