Theme = Struct.new(:header_background, :header_text_color, keyword_init: true) do
  extend ActiveModel::Naming
  def self.parse(str)
    new(str || {})
  end
end
