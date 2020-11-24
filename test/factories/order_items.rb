# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    order
    menu_item
    quantity { 1 }
    price_cents { 10_00 }
    price_currency { 'MXN' }
  end
end
