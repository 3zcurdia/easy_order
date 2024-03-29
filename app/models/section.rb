# frozen_string_literal: true

class Section < ApplicationRecord
  self.implicit_order_column = 'position'
  belongs_to :menu
  has_many :menu_items, dependent: :destroy

  validates :name, presence: true

  scope :with_items, -> { where('sections.menu_items_count > ?', 0) }

  def as_json(_opts)
    { id: id, position: position, name: name }.as_json
  end
end
