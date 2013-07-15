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

  test "should get new" do
    get :new, store_id: @store.id
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, title: @product.title }, store_id: @store.id
    end

    assert_redirected_to store_product_path(@store, assigns(:product))
  end

  test "should show product" do
    get :show, id: @product, store_id: @store.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product, store_id: @store.id
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { description: @product.description, title: @product.title }, store_id: @store.id
    assert_redirected_to store_product_path(@store, assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product, store_id: @store.id
    end

    assert_redirected_to store_products_path(@store)
  end
end
