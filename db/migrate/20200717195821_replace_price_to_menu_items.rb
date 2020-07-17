class ReplacePriceToMenuItems < ActiveRecord::Migration[6.0]
  def change
    change_column :menu_items, :currency, :price_currency, :string, default: 'MXN'
    change_column :menu_items, :price_cents, :integer, null: false, default: 0
  end
end
