class MenuItem < ApplicationRecord
  self.implicit_order_column = 'position'
  belongs_to :menu, touch: true
  belongs_to :section, touch: true
  has_one_attached :photo

  validates :name, :price_cents, :price_currency, presence: true

  monetize :price_cents

  def merchant
    menu.merchant
  end

  def available=(value)
    meta['available'] = !!value
  end

  def available
    !!meta['available']
  end
end
