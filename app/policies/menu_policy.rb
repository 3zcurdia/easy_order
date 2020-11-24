# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    admin?
  end
end
