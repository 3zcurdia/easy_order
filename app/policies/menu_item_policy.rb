class MenuItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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

  def owner?
    user.merchant? && record.merchant.user_id == user.id
  end
end
