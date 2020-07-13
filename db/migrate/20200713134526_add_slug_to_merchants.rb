class AddSlugToMerchants < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :slug, :string
    add_index :merchants, :slug, unique: true
  end
end
