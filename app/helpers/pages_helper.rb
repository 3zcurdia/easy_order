# frozen_string_literal: true

module PagesHelper
  def whatsapp_url(phone, message = "Hola vi su menu en linea y me gustaria ordenar:")
    query = URI.encode_www_form(text: message)
    URI.parse("https://wa.me/#{phone}?#{query}").to_s
  end

  def header_style(theme)
    "background-color: #{theme.header_background || "#363636"};"
  end

  def merchant_meta_tags(merchant)
    content_for(:title, merchant.name)
    content_for(:description, merchant.description)
    content_for(:keywords, merchant.keywords) if merchant.keywords.present?
  end
end
