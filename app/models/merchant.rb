class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_one :menu, dependent: :destroy
  has_many :items, through: :menu

  scope :owned_by, ->(users) { where(user_id: users.select(:id)) }

  validates :name, :slug, presence: true

  store :info, accessors: %i[category address delivery payment_methods], coder: JSON
  geocoded_by :address
  after_validation :geocode

  def menu_items
    menu&.items || []
  end
end
