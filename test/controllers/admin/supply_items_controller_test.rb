require 'test_helper'

class Admin::SupplyItemsControllerTest < ActionController::TestCase
  setup do
    @admin_supply_item = admin_supply_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_supply_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_supply_item" do
    assert_difference('Admin::SupplyItem.count') do
      post :create, admin_supply_item: {  }
    end

    assert_redirected_to admin_supply_item_path(assigns(:admin_supply_item))
  end

  test "should show admin_supply_item" do
    get :show, id: @admin_supply_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_supply_item
    assert_response :success
  end

  test "should update admin_supply_item" do
    patch :update, id: @admin_supply_item, admin_supply_item: {  }
    assert_redirected_to admin_supply_item_path(assigns(:admin_supply_item))
  end

  test "should destroy admin_supply_item" do
    assert_difference('Admin::SupplyItem.count', -1) do
      delete :destroy, id: @admin_supply_item
    end

    assert_redirected_to admin_supply_items_path
  end
end
