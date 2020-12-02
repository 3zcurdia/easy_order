# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.merchant.orders
    end
  end

  def index?
    admin_or_merchant?
  end

  def show?
    true
  end

  def create?
    true
  end
end
