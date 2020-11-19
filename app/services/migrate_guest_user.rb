class MigrateGuestUser < ApplicationService
  def initialize(id, merchant_id)
    @guest = User.guest.find(id)
    @merchant = Merchant.find_by(id: merchant_id)
  end

  def call(user)
    move_merchant_to(user)
    update_role(user)
    destroy
  end

  private

  def update_role(user)
    return unless user.guest?

    role = Merchant.where(user_id: user.id).exists? ? :merchant : :user
    user.update(role: role)
  end

  def move_merchant_to(user)
    return unless merchant

    merchant.update(user_id: user.id)
  end

  def destroy
    guest.reload.destroy
  end

  attr_reader :guest, :merchant
end
