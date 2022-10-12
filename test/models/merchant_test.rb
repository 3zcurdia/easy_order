# frozen_string_literal: true

require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def user
    @user ||= create(:user)
  end

  def subject
    @subject ||= create(:merchant, user: user)
  end

  context 'validations' do
    should validate_presence_of(:name)
  end

  test 'must be valid' do
    assert_predicate subject, :valid?
  end

  test 'must generate a valid slug' do
    assert_equal 'pizza-plaza', subject.slug
  end

  test 'must create menu after create' do
    assert Menu.exists?(merchant_id: subject.id)
  end

  test 'must cast to boolean string on delivery' do
    subject.delivery = '1'
    assert subject.delivery
  end

  test 'must pass false on delivery' do
    subject.delivery = false
    assert_not subject.delivery
  end
end
