class ApplicationController < ActionController::Base
  include GuestUserAuthConcern
  helper_method :current_or_guest_user
end
