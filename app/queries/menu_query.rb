# frozen_string_literal: true

class MenuQuery
  def initialize(scope: Menu)
    @scope = scope
  end

  def items_by_section(section_id)
    if section_id.blank?
      scope.sections.first.menu_items
    else
      scope.items.where(section_id: section_id)
    end
  end

  private

  attr_reader :menu, :scope
end
