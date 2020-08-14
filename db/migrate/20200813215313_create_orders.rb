class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :merchant, null: false, foreign_key: true
      t.integer :total_cents, default: 0
      t.string :total_currency, default: 'MXN', null: false

      t.timestamps
    end
  end
end
