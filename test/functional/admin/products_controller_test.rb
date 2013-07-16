require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @owner = users(:owner)

    sign_in @owner
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, title: @product.title }
    end

    assert_redirected_to admin_product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { description: 'desc 111', title: 'update 11' }
    assert_redirected_to admin_product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to admin_products_path(@store)
  end
end
