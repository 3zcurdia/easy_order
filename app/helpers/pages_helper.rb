module PagesHelper
  def whatsapp_url(phone, message)
    URI.encode("https://wa.me/52#{phone}?text=#{message}")
  end
end
