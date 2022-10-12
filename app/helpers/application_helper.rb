# frozen_string_literal: true

module ApplicationHelper
  def safe_variant(photo, **options)
    if photo.variable?
      opts = { **options, convert: { format: "webp" } }
      photo.variant(**opts)
    else
      photo
    end
  end
end
