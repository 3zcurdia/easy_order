# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
