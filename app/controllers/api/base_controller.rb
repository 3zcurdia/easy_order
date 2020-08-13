module Api
  class BaseController < ActionController::API
    include Pundit
    before_action :default_format_json

    def default_format_json
      request.format = 'json'
    end
  end
end
