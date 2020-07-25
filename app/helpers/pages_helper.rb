module PagesHelper
  def whatsapp_url(phone, message = 'Hola vi su menu en linea y me gustaria ordenar:')
    query = URI.encode_www_form(text: message)
    URI.parse("https://wa.me/#{phone}?#{query}").to_s
  end

  def merchant_meta_tags(merchant)
    content_for(:title, merchant.name)
    content_for(:description, merchant.description)
    content_for(:keywords, merchant.keyword_list.to_s) if merchant.keywords.exists?
  end
end
