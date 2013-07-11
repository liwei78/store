require 'test_helper'

class ShippmentsControllerTest < ActionController::TestCase
  setup do
    @shippment = shippments(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shippments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shippment" do
    assert_difference('Shippment.count') do
      post :create, shippment: { number: @shippment.number }
    end

    assert_redirected_to shippment_path(assigns(:shippment))
  end

  test "should show shippment" do
    get :show, id: @shippment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shippment
    assert_response :success
  end

  test "should update shippment" do
    put :update, id: @shippment, shippment: { number: @shippment.number }
    assert_redirected_to shippment_path(assigns(:shippment))
  end

  test "should destroy shippment" do
    assert_difference('Shippment.count', -1) do
      delete :destroy, id: @shippment
    end

    assert_redirected_to shippments_path
  end
end
