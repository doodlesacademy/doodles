json.array!(@admin_project_sets) do |admin_project_set|
  json.extract! admin_project_set, :id
  json.url admin_project_set_url(admin_project_set, format: :json)
end
