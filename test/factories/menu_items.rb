# frozen_string_literal: true

FactoryBot.define do
  factory :menu_item do
    menu
    section
    name { "Mi producto" }
    description { "Lorem ipsum dolor sit amet" }
    price_cents { 100_00 }
    price_currency { "MXN" }
  end
end
