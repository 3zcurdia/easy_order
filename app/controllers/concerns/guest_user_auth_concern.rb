module GuestUserAuthConcern
  extend ActiveSupport::Concern

  def current_or_guest_user
    if current_user
      upgrade_guest_user
      destroy_guest_user
      current_user
    else
      create_guest_user
      guest_user
    end
  end

  def guest_user
    @guest_user ||= User.find(session[:guest_user_id])
  end

  def guest_signed_in?
    session[:guest_user_id].present?
  end

  private

  def create_guest_user
    return if guest_signed_in?

    user = User.create_guest
    session[:guest_user_id] = user.id
    user
  end

  def upgrade_guest_user
    return unless guest_signed_in?

    Merchant.where(user_id: guest_user.id).update_all(user_id: current_user.id)
  end

  def destroy_guest_user
    return unless guest_signed_in?

    guest_user.reload.destroy
    session[:guest_user_id] = nil
  end
end
