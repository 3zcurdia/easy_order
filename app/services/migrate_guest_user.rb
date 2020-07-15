class MigrateGuestUser
  def initialize(id)
    @guest = User.guest.find(id)
  end

  def call(user)
    move_merchant_to(user)
    destroy
  end

  private

  def move_merchant_to(user)
    Merchant.where(user_id: guest.id).update_all(user_id: user.id)
  end

  def destroy
    guest.reload.destroy
  end

  attr_reader :guest
end
