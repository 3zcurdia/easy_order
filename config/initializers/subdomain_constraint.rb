# frozen_string_literal: true

class SubdomainConstraint
  def self.matches?(request)
    request.domain == ENV['HOST'] && request.subdomain.present? && request.subdomain != 'www'
  end
end
