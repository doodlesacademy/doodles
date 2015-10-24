require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save without title" do
    project = Project.new
    assert_not project.save, "Saved project without a title."
  end
end
