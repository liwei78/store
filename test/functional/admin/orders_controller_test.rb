require 'test_helper'

class Admin::OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @owner = users(:owner)
    sign_in @owner
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { amount: @order.amount, number: @order.number }
    end

    assert_redirected_to admin_order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: { amount: @order.amount, number: @order.number }
    assert_redirected_to admin_order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to admin_orders_path
  end
end
