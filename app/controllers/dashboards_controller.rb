class DashboardsController < ApplicationController
  include GuestUserAuthConcern
  before_action :authenticate_user!
  before_action :migrate_guest

  def show
    @merchants = current_user.merchants
  end
end
