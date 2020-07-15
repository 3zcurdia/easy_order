class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_one :menu, dependent: :destroy
  has_many :items, through: :menu

  validates :name, :slug, presence: true

  def menu_items
    menu&.items || []
  end
end
