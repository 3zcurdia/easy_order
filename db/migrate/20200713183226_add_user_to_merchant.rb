class AddUserToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_reference :merchants, :user, null: false, foreign_key: true
  end
end
