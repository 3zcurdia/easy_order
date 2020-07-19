module Builder
  class MerchantsController < BaseController
    def new
      @merchant = Merchant.new(user: guest_user)
    end

    def show
      @merchant = merchant
    end

    def create
      @merchant = Merchant.new(merchant_params)
      if @merchant.save
        session[:guest_merchant_id] = @merchant.id
        redirect_to new_builder_menu_path
      else
        render :new
      end
    end

    private

    def merchant_params
      params.require(:merchant).permit(:user_id, :name)
    end
  end
end
