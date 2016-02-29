json.array!(@admin_standards) do |admin_standard|
  json.extract! admin_standard, :id
  json.url admin_standard_url(admin_standard, format: :json)
end
