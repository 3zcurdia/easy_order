class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.references :menu, null: false, foreign_key: true, index: true
      t.string :name
      t.text :description
      t.integer :price_cents
      t.string :currency, default: 'MXN'

      t.timestamps
    end
  end
end
