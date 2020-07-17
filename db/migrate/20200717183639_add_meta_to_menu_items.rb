class AddMetaToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :meta, :jsonb, default: {}
  end
end
