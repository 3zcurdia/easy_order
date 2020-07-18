class PagesController < ApplicationController
  layout 'landing_page'
  before_action :set_merchant

  def show
    respond_to do |format|
      format.html { render :show }
      format.svg  { render inline: svg_file }
      format.png  { render file: png_file, layout: false }
    end
  end

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:id])
  end

  def permited_params
    params.permit(:delivery)
  end

  def code
    @code ||= RQRCode::QRCode.new(page_url(@merchant, permited_params))
  end

  def svg_file
    code.as_svg
  end

  def png_file
    filepath = "tmp/#{@merchant.slug}.png"
    return filepath if File.exist?(filepath)

    code.as_png(size: 512).save(filepath)
    filepath
  end
end
