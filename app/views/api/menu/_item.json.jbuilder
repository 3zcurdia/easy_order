json.id item.id
json.position item.position
json.name item.name
json.description item.description
json.price_currency item.price_currency
json.price_cents item.price_cents
json.image_url item.photo.attached? ? url_for(item.photo) : nil
json.section_id item.section_id
json.created_at item.created_at
json.updated_at item.updated_at
