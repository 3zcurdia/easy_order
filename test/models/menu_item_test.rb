# frozen_string_literal: true

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  def subject
    @subject ||= build_stubbed(:menu_item)
  end

  context 'validations' do
    should validate_presence_of(:name)
  end

  test 'must be valid' do
    assert_predicate subject, :valid?
  end
end
