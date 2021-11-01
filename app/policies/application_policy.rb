# frozen_string_literal: true

class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    delegate :admin?, to: :user
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def permitted_attributes
    []
  end

  protected

  delegate :admin?, :merchant?, to: :user

  def owner?
    record.user == user
  end

  def admin_or_owner?
    admin? || owner?
  end

  def admin_or_merchant?
    admin? || merchant?
  end
end
