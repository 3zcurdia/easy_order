class CopyKeywordsToMeta < ActiveRecord::Migration[6.0]
  def up
    Merchant.find_each do |m|
      m.info[:keywords] = m.keyword_list.to_s
      m.save
    end
  end
end
