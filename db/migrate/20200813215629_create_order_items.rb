class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.integer :price_cents, default: 0
      t.string :price_currency, default: 'MXN', null: false

      t.timestamps
    end
  end
end
