# frozen_string_literal: true

class ApplicationService
  def self.call(...)
    new(...).call
  end

  def self.to_proc(*_args, &block)
    proc { |*args| new(*args, &block).call }
  end
end
