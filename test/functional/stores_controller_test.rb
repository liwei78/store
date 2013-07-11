require 'test_helper'

# every on can do
class StoresControllerTest < ActionController::TestCase
  test "everyone should get index" do
    @store = stores(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "everyone should show store" do
    @store = stores(:one)
    get :show, id: @store
    assert_response :success
  end

end

# what a owner can do
class StoresControllerTest < ActionController::TestCase
  setup do
    @owner = users(:owner)
    sign_in @owner
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { description: @store.description, title: @store.title }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    put :update, id: @store, store: { description: @store.description, title: @store.title }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
