# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def subject
    @subject ||= build_stubbed(:order)
  end

  test 'must be valid' do
    assert_predicate subject, :valid?
  end
end
