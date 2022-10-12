# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_merchant
    return if request.subdomain.blank?

    @current_merchant ||= Merchant.find_by(slug: request.subdomain)
  end

  def user_not_authorized
    flash[:alert] = 'No estas autorizado para realizar esta acción.'
    redirect_to(request.referer || root_path)
  end
end
