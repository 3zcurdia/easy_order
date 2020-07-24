require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
  end
end
