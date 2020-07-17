class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user
  has_one :menu, dependent: :destroy
  has_many :items, through: :menu

  scope :with_slug, ->(name) { where(slug: name.parameterize) }
  scope :owned_by, ->(users) { where(user_id: users.select(:id)) }

  validates :name, presence: true
  validates :phone, numericality: { only_integer: true }, allow_nil: true

  store :info, accessors: %i[category address delivery payment_methods], coder: JSON
  geocoded_by :address
  after_validation :geocode

  def menu_items
    menu&.items || []
  end

  private

  def slug_candidates
    [
      :name,
      [:name, SecureRandom.hex[0..6]],
      [:name, SecureRandom.uuid]
    ]
  end
end
