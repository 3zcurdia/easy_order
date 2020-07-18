class MenuItem < ApplicationRecord
  belongs_to :menu
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
