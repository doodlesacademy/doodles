json.array!(@admin_members) do |admin_member|
  json.extract! admin_member, :id
  json.url admin_member_url(admin_member, format: :json)
end
