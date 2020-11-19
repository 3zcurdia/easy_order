# frozen_string_literal: true

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def self.to_proc(*args, &block)
    proc { |*args| self.new(*args, &block).call }
  end
end
