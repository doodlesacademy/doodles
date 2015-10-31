require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "it should not save without title" do
    lesson = Lesson.new(video_uri: 'http://blahblah.com/')
    assert_not lesson.save, "Lesson saved without title."
  end

  test "it should not save without video_uri" do
    lesson = Lesson.new(title: 'Test title!')
    assert_not lesson.save, "Lesson saved without video_uri"
  end 
end
