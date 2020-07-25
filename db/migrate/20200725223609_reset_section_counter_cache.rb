class ResetSectionCounterCache < ActiveRecord::Migration[6.0]
  def up
    Section.find_each do |section|
      Section.reset_counters(section.id, :menu_items)
    end
  end

  def down; end
end
