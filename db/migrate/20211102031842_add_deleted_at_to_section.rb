class AddDeletedAtToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :deleted_at, :datetime
  end
end
