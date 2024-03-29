# frozen_string_literal: true

class MenuItem < ApplicationRecord
  acts_as_paranoid
  self.implicit_order_column = "position"
  belongs_to :menu, touch: true
  belongs_to :section, counter_cache: true, touch: true
  has_one_attached :photo
  has_many :order_items, dependent: :restrict_with_error

  validates :name, presence: true

  monetize :price_cents

  delegate :merchant, to: :menu

  def toggle_availability
    self.available = !available
    save!
  end

  def available=(value)
    meta["available"] = !!value
  end

  def available
    !!meta["available"]
  end
end
