json.id merchant.slug
json.name merchant.name
json.logo_url merchant.logo.attached? ? rails_blob_url(merchant.logo) : nil
json.description merchant.description
json.keywords merchant.keywords
json.phone merchant.phone
json.delivery merchant.delivery
json.latitude merchant.latitude
json.longitude merchant.longitude
json.created_at merchant.created_at
json.updated_at merchant.updated_at
