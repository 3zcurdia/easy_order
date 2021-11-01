# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_merchant
    return if request.subdomain.blank?

    @current_merchant ||= Merchant.friendly.find(request.subdomain)
  end

  def user_not_authorized
    flash[:alert] = 'No estas autorizado para realizar esta acción.'
    redirect_to(request.referer || root_path)
  end
end
