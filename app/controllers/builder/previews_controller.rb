module Builder
  class PreviewsController < BaseController
    before_action :authorize_step!

    def show
      @merchant = merchant
    end
  end
end
