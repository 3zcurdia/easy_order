module PagesHelper
  def whatsapp_url(phone, message)
    query = URI.encode_www_form(text: message)
    URI.parse("https://wa.me/52#{phone}?#{query}").to_s
  end
end
