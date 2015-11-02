require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  @@blank_project = Project.new
  @@valid_params = {
    title: 'Superheroes',
    level: 'upper'
  }

  test "should not be valid without title" do
    assert_not @@blank_project.valid?
  end

  test "should not be valid with unsupported level" do
    project = Project.new(@@valid_params)
    project.level = "pancakes"
    assert_not project.valid?
  end

  test "should get supply_items through its lessons" do
    assert @@blank_project.respond_to?(:supply_items)
  end
end
