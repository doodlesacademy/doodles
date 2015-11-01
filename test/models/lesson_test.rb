require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  @@valid_params = {
    title: 'This is a title',
    video_uri: 'http://vimeo.com'
  }

  test "it should not be valid without a title" do
    params = @@valid_params.keep_if { |k, _v| k != :title }
    lesson = Lesson.new(params)
    assert_not lesson.valid?
  end

  test "it should not be valid without video_uri" do
    params = @@valid_params.keep_if { |k, _v| k != :video_uri }
    lesson = Lesson.new(params)
    assert_not lesson.valid?
  end

  test "it should respond to #supply_items" do
    params = @@valid_params
    lesson = Lesson.new(params)
    assert lesson.respond_to?('supply_items')
  end
end
