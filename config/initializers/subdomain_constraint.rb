# frozen_string_literal: true

class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && (request.subdomain != 'www' || request.subdomain != 'menufacilito')
  end
end
