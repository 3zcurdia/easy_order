class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.references :merchant, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
