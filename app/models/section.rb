# frozen_string_literal: true

class Section < ApplicationRecord
  acts_as_paranoid
  self.implicit_order_column = "position"
  belongs_to :menu
  has_one :merchant, through: :menu
  has_many :menu_items, dependent: :restrict_with_error

  validates :name, presence: true

  scope :with_items, -> { where("sections.menu_items_count > ?", 0) }

  def as_json(_opts)
    { id: id, position: position, name: name }.as_json
  end
end
