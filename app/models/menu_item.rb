class MenuItem < ApplicationRecord
  acts_as_paranoid
  self.implicit_order_column = 'position'
  belongs_to :menu, touch: true
  belongs_to :section, counter_cache: true, touch: true
  has_one_attached :photo
  has_many :order_items, dependent: :destroy

  validates :name, presence: true

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
