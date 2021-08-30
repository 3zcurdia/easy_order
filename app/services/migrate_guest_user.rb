# frozen_string_literal: true

class MigrateGuestUser < ApplicationService
  def initialize(current_user, **args)
    @current_user = current_user
    @guest_user = User.guest.find(args['guest_user_id'])
    @merchant = Merchant.find(args['guest_merchant_id'])
    super()
  end

  def call
    User.transaction do
      merchant.update!(user_id: current_user.id)
      current_user.update!(role: :merchant)
      guest_user.destroy!
    end
  end

  private

  attr_reader :current_user, :guest_user, :merchant
end
