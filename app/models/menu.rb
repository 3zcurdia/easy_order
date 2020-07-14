class Menu < ApplicationRecord
  belongs_to :merchant
  has_many :items, class_name: 'MenuItem', dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: lambda { |x|
    x['name'].blank? && x['price'].blank?
  }
end
