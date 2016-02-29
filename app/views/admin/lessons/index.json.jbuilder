json.array!(@admin_lessons) do |admin_lesson|
  json.extract! admin_lesson, :id
  json.url admin_lesson_url(admin_lesson, format: :json)
end
