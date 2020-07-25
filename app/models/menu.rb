class Menu < ApplicationRecord
  belongs_to :merchant
  has_many :sections
  has_many :items, class_name: 'MenuItem', dependent: :destroy

  after_create :create_sections

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: lambda { |x|
    x['name'].blank? && x['price'].blank?
  }

  def empty?
    !items.exists?
  end

  def build_items(number = 4)
    number.times { |i| items.build(position: i, section: sections.first) }
  end

  private

  def create_sections
    return unless sections.empty?

    %w[Alimentos Bebidas Postres].each_with_index do |name, idx|
      sections.create(name: name, position: idx)
    end
  end
end
