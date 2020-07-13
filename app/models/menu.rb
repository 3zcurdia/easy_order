class Menu < ApplicationRecord
  belongs_to :merchant
  has_many :items, class_name: 'MenuItem', dependent: :destroy
end
