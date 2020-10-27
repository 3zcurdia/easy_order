class Merchant < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user
  has_one :menu, dependent: :destroy
  has_many :items, through: :menu
  has_many :sections, through: :menu
  has_many :orders, dependent: :destroy
  has_one_attached :logo

  scope :with_slug, ->(name) { where(slug: name.parameterize) }
  scope :owned_by, ->(users) { where(user_id: users.select(:id)) }
  scope :active, -> { owned_by(User.where(role: :merchant)) }
  scope :demo, -> { owned_by(User.where(role: :guest)) }

  validates :name, presence: true
  validates :phone, numericality: { only_integer: true }, allow_nil: true

  delegate :header_background,
           :header_background=, to: :theme, prefix: true

  store :info, accessors: %i[keywords description address payment_methods], coder: JSON
  geocoded_by :address

  after_validation :geocode
  before_save :serialize_theme
  after_create :create_menu

  def menu_items
    menu&.items&.includes(photo_attachment: :blob)
  end

  def delivery=(value)
    info['delivery'] =
      case value
      when TrueClass
        value
      when String
        value == '1'
      else
        false
      end
  end

  def delivery
    info['delivery']
  end

  def ready_to_deliver?
    delivery && phone
  end

  def demo?
    user.guest?
  end

  def logo_attached?
    logo.attached?
  end

  def theme
    @theme ||= Theme.parse(info['theme'])
  end

  private

  def slug_candidates
    [
      :name,
      [:name, SecureRandom.hex[0..6]],
      [:name, SecureRandom.uuid]
    ]
  end

  def serialize_theme
    info['theme'] = theme.to_h
  end
end
