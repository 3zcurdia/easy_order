class MerchantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.includes(:keywords).all
      else
        user.merchants.includes(:keywords)
      end
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

  def update?
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end
end
