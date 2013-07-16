require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @owner = users(:owner)
    @store = stores(:one)

    sign_in @owner
  end

  test "should get index" do
    get :index, store_id: @store.id
    assert_response :success
    assert_not_nil assigns(:products)
  end


  test "should show product" do
    get :show, id: @product, store_id: @store.id
    assert_response :success
  end


end
