module PagesHelper
  def delivery?(merchant)
    merchant.delivery && merchant.phone.present?
  end

  def whatsapp_url(phone, message = 'Hola vi su menu en linea y me gustaria ordenar:')
    query = URI.encode_www_form(text: message)
    URI.parse("https://wa.me/#{phone}?#{query}").to_s
  end
end
