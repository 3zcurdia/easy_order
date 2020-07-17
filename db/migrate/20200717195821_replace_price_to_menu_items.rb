class ReplacePriceToMenuItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :menu_items, :currency, :price_currency
    change_column_default :menu_items, :price_currency, 'MXN'
    change_column :menu_items, :price_cents, :integer, null: false, default: 0
  end
end
