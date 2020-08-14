class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.merchant.orders
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end
end
