class AddUnitToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :unit, :string
  end
end
