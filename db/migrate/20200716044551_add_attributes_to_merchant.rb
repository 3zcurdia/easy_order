class AddAttributesToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :phone, :string
    add_column :merchants, :latitude, :float
    add_column :merchants, :longitude, :float
    add_column :merchants, :info, :jsonb, default: {}

    add_index :merchants, %i[latitude longitude]
  end
end
