class MenuItem < ApplicationRecord
  belongs_to :menu
  validates :name, :description, :price_cents, :currency, presence: true
end
