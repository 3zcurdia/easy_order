# frozen_string_literal: true

class OrderItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :order
  belongs_to :menu_item
  monetize :price_cents
  before_save :fetch_current_prices

  delegate :name, to: :menu_item

  def subtotal
    price * quantity
  end

  def to_s
    "#{quantity} #{unit} de #{name}"
  end

  def fetch_current_prices
    self.price_cents = menu_item.price_cents
    self.price_currency = menu_item.price_currency
  end
end
