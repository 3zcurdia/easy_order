class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
