require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  test 'association' do
    collection = Collection.first
    assert_equal 'Great one', collection.title

    assert_equal 2, collection.project_sets.count
  end
end
