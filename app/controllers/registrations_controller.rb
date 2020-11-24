# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    migrate_guest
    super
  end

  def migrate_guest
    return if session[:guest_user_id].blank?

    MigrateGuestUser.new(session[:guest_user_id], session[:guest_merchant_id]).call(current_user)
    session[:guest_user_id] = session[:guest_merchant_id] = nil
  end
end
