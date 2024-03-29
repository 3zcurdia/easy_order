# frozen_string_literal: true

class CodesController < ApplicationController
  layout nil

  def show
    head :not_found, content_type: "text/html" and return unless Merchant.exists?(slug: params[:merchant_id])

    respond_to do |format|
      format.svg  { render inline: svg_file }
      format.png  { render file: png_file, layout: false }
    end
  end

  private

  def code
    @code ||= RQRCode::QRCode.new(page_url(params[:merchant_id]))
  end

  def svg_file
    code.as_svg
  end

  def png_file
    filepath = "tmp/#{params[:merchant_id]}.png"
    return filepath if File.exist?(filepath)

    code.as_png(size: 512).save(filepath)
    filepath
  end
end
