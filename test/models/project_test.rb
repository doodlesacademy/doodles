require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  @@blank_project = Project.new

  test "should not be valid without title" do
    assert_not @@blank_project.valid?
  end

  test "should get supply_items through its lessons" do
    assert @@blank_project.respond_to?(:supply_items)
  end
end
