require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get board" do
    get :board
    assert_response :success
  end

  test "should get donors" do
    get :donors
    assert_response :success
  end
end
