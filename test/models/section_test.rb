# frozen_string_literal: true

require "test_helper"

class SectionTest < ActiveSupport::TestCase
  def subject
    @subject ||= build_stubbed(:menu)
  end

  test "must be valid" do
    assert_predicate subject, :valid?
  end
end
