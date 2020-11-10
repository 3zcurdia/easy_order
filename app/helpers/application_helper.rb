module ApplicationHelper
  def safe_variant(photo, **options)
    if photo.variable?
      photo.variant(**(options).merge(convert: { format: 'webp' }))
    else
      photo
    end
  end
end
