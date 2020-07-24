module Builder
  class MenusController < BaseController
    before_action :authorize_step!

    def new
      @menu = merchant.menu
      @menu.init_items(4) if @menu.empty?
    end

    def show
      @menu = merchant.menu
    end

    def update
      @menu = merchant.menu
      if @menu.update(menu_attributes)
        redirect_to builder_preview_path
      else
        render :new
      end
    end

    private

    def menu_attributes
      params.require(:menu).permit(items_attributes: %i[id position name price available])
    end
  end
end
