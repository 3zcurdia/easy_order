# frozen_string_literal: true

class MenuItemPolicy < ApplicationPolicy
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

  def permitted_attributes
    %i[position name description price photo section_id unit]
  end

  def owner?
    merchant? && record.merchant.user_id == user.id
  end
end
