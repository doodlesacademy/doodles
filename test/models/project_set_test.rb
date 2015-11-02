require 'test_helper'

class ProjectSetTest < ActiveSupport::TestCase
  test "should relate to its associated lessons" do
    set = ProjectSet.new
    assert set.respond_to?(:upper)
    assert set.respond_to?(:lower)
  end
end
