# frozen_string_literal: true

class SectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.none
    end
  end

  def index?
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

  def owner?
    user.merchant? && record.menu.merchant.user_id == user.id
  end
end
