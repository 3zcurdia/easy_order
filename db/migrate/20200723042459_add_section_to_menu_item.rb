class AddSectionToMenuItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :menu_items, :section, null: true, foreign_key: true
  end
end
