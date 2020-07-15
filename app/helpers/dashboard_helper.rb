module DashboardHelper
  def svg_code(url, size = 5)
    raw RQRCode::QRCode.new(url).as_svg(module_size: size)
  end
end
