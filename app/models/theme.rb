Theme = Struct.new(:header_background, keyword_init: true) do
  extend ActiveModel::Naming
  def self.parse(hash)
    attributes = Theme.new.to_h.keys
    hash = (hash || {}).select { |k, _v| attributes.include?(k.to_sym) }
    new(hash || {})
  end
end
