Theme = Struct.new(:header_background, keyword_init: true) do
  extend ActiveModel::Naming
  def self.parse(str)
    new(str || {})
  end
end
