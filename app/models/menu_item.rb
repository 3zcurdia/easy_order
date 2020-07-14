class MenuItem < ApplicationRecord
  belongs_to :menu
  validates :name, :description, :price_cents, :currency, presence: true

  def price=(value)
    self.price_cents = (value.to_f * 10).to_i
  end

  def price
    price_cents / 10.0
  end
end
