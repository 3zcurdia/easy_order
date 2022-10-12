# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    include Pundit::Authorization
    before_action :default_format_json

    def default_format_json
      request.format = "json"
    end
  end
end
