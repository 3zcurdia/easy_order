class Merchant < ApplicationRecord
  validates :name, presence: true
  has_one :menu
  has_many :items, through: :menu
end
