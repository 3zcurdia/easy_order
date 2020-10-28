module ApplicationHelper
  def safe_variant(photo, **options)
    if photo.variable?
      photo.variant(**options)
    else
      photo
    end
  end
end
