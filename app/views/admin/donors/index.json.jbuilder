json.array!(@admin_donors) do |admin_donor|
  json.extract! admin_donor, :id
  json.url admin_donor_url(admin_donor, format: :json)
end
