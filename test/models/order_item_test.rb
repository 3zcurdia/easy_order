# frozen_string_literal: true

require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  def subject
    @subject ||= build_stubbed(:order_item)
  end

  test "must be valid" do
    assert_predicate subject, :valid?
  end
end
