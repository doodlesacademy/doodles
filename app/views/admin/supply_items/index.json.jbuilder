json.array!(@admin_supply_items) do |admin_supply_item|
  json.extract! admin_supply_item, :id
  json.url admin_supply_item_url(admin_supply_item, format: :json)
end
