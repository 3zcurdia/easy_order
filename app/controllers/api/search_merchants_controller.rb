module Api
  class SearchMerchantsController < BaseController
    def index
      slug = name.parameterize
      render json: { slug: slug, available: available?(slug) }
    end

    def available?(name)
      !Merchant.with_slug(name).exists?
    end

    private

    def name
      params.require(:name)
    end
  end
end
