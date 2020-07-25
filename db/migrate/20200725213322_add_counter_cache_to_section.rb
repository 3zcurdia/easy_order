class AddCounterCacheToSection < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :menu_items_count, :integer, default: 0
  end
end
