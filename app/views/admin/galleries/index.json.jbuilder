json.array!(@admin_galleries) do |admin_gallery|
  json.extract! admin_gallery, :id
  json.url admin_gallery_url(admin_gallery, format: :json)
end
