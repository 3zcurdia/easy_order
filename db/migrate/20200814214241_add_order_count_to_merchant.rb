class AddOrderCountToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :orders_count, :integer, default: 0
  end
end
