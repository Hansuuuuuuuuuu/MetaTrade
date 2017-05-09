json.extract! user_listing, :id, :card_name, :quantity, :condition, :price, :created_at, :updated_at
json.url user_listing_url(user_listing, format: :json)
