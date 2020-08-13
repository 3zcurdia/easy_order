module Api
  class BaseController < ActionController::API
    include Pundit
  end
end
