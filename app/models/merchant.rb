class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one :menu
  has_many :items, through: :menu

  validates :name, :slug, presence: true
end
