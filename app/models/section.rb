class Section < ApplicationRecord
  self.implicit_order_column = 'position'
  belongs_to :menu, touch: true
  validates :name, presence: true
end
