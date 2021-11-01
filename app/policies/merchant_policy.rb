# frozen_string_literal: true

class MerchantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        user.merchants
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

  def permitted_attributes
    %i[name phone delivery keywords logo description theme_header_background]
  end
end
