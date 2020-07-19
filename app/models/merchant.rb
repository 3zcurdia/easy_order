class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user
  has_one :menu, dependent: :destroy
  has_many :items, through: :menu
  has_one_attached :logo

  scope :with_slug, ->(name) { where(slug: name.parameterize) }
  scope :owned_by, ->(users) { where(user_id: users.select(:id)) }
  scope :demo, -> { owned_by(User.where(role: :guest)) }

  validates :name, presence: true
  validates :phone, numericality: { only_integer: true }, allow_nil: true

  store :info, accessors: %i[category address payment_methods], coder: JSON
  geocoded_by :address
  after_validation :geocode
  after_create :create_menu

  def menu_items
    menu&.items || []
  end

  def delivery=(value)
    info['delivery'] = if value.is_a?(TrueClass) || value.is_a?(FalseClass)
                         value
                       else
                         value == '1'
                       end
  end

  def delivery
    info['delivery']
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
