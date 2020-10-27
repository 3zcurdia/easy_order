module DashboardHelper
  def svg_code(merchant, size = 5)
    raw RQRCode::QRCode.new(page_url(merchant)).as_svg(module_size: size)
  end
end
