class Section < ApplicationRecord
  self.implicit_order_column = 'position'
  belongs_to :menu
  validates :name, presence: true
end
