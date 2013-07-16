require 'test_helper'

class Admin::ShippmentsControllerTest < ActionController::TestCase
  setup do
    @shippment = shippments(:one)
    @owner = users(:owner)
    sign_in @owner
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
      post :create, shippment: { number: '00000' }
    end

    assert_redirected_to admin_shippment_path(assigns(:shippment))
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
    put :update, id: @shippment, shippment: { number: '111222' }
    @shippment.reload
    assert_equal @shippment.number, '111222'
    assert_redirected_to admin_shippment_path(assigns(:shippment))
  end

  test "should destroy shippment" do
    assert_difference('Shippment.count', -1) do
      delete :destroy, id: @shippment
    end

    assert_redirected_to admin_shippments_path
  end
end
