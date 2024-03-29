# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    migrate_guest
    dashboard_path
  end

  def migrate_guest
    return if session[:guest_user_id].blank?

    MigrateGuestUser.call(current_user, **session)
    session[:guest_user_id] = session[:guest_merchant_id] = nil
  end
end
