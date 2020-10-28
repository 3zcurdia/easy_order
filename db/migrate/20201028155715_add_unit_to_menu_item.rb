class AddUnitToMenuItem < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :unit, :string, default: 'pz'
  end
end
