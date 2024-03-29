# frozen_string_literal: true

module GuestUserAuthConcern
  extend ActiveSupport::Concern

  def guest_user
    @guest_user ||= User.find(session[:guest_user_id])
  rescue ActiveRecord::RecordNotFound
    guest_sign_out
    redirect_to root_path and return
  end

  def guest_signed_in?
    session[:guest_user_id].present?
  end

  def guest_sign_out
    session[:guest_user_id] = nil
  end

  def enable_guest_user
    return if guest_signed_in?

    @guest_user = User.create_guest
    session[:guest_user_id] = @guest_user.id
  end
end
