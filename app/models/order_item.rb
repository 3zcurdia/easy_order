class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  monetize :price_cents
  before_save :fetch_current_prices

  def name
    menu_item.name
  end

  def subtotal
    price * quantity
  end

  def to_s
    "#{quantity} #{name}"
  end

  def fetch_current_prices
    self.price_cents = menu_item.price_cents
    self.price_currency = menu_item.price_currency
  end
end
