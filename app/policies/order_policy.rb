# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
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
