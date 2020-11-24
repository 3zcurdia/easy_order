# frozen_string_literal: true

json.id item.id
json.position item.position
json.name item.name
json.description item.description
json.price_currency item.price_currency
json.price_cents item.price_cents
json.image_url item.photo.attached? ? rails_blob_url(item.photo) : nil
json.section item.section
json.created_at item.created_at
json.updated_at item.updated_at
