class Order < ApplicationRecord
  belongs_to :merchant
  monetize :total_cents
  has_many :items, class_name: 'OrderItem', dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: ->(x) { x['quantity'].to_i < 1 }

  after_create :set_total

  def message
    "Hola, me gustaria ordenar: \n" + items.map(&:to_s).join(",\n")
  end

  def set_total
    update(total: items.sum(&:subtotal))
  end
end
