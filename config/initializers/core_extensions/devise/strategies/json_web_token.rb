# frozen_string_literal: true

module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        bearer_header.present?
      end

      def authenticate!
        return if no_claims_or_no_claimed_sub

        success! User.find_by(id: claims["sub"])
      end

      protected

      def bearer_header
        request.headers["Authorization"]&.to_s
      end

      def no_claims_or_no_claimed_sub
        !claims || !claims.key?("sub")
      end

      private

      def claims
        strategy, token = bearer_header.split
        return unless strategy.to_s.casecmp("bearer").zero?

        JwtWrapper.decode(token)
      end
    end
  end
end
