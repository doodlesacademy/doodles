require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "it should not save without title" do
    lesson = Lesson.new
    assert_not lesson.save, "Lesson saved without title."
  end
end
