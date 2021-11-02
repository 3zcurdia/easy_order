# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
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
