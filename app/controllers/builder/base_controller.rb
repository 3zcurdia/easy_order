module Builder
  class BaseController < ApplicationController
    include GuestUserAuthConcern
    before_action :redirect_logged_user
    before_action :enable_guest_user

    def redirect_logged_user
      redirect_to dashboard_path if user_signed_in?
    end

    def authorize_step!
      return if merchant_demo?

      redirect_to new_builder_merchant_path
    end

    def merchant_demo?
      session[:guest_merchant_id].present?
    end

    def merchant
      @merchant ||= Merchant.includes(menu: :items).find(session[:guest_merchant_id])
    rescue ActiveRecord::RecordNotFound
      @merchant = session[:guest_merchant_id] = nil
      redirect_to new_builder_merchant_path and return
    end
  end
end
