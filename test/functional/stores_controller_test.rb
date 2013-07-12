require 'test_helper'

# every on can do
class StoresControllerTest < ActionController::TestCase
  test "everyone should get index" do
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

  # owner can not create a new again
  test "owner should get new" do
    @user = users(:owner)
    sign_in @user
    assert_raise CanCan::AccessDenied do
      get :new
    end
  end

  test "owner should create store" do
    @user = users(:owner)
    sign_in @user
    assert_raise CanCan::AccessDenied do
      post :create, store: { description: 'some', title: 'some' }
    end
  end

  test "owner should get edit" do
    @user = users(:owner)
    sign_in @user
    @store = stores(:one)
    get :edit, id: @store
    assert_response :success
  end

  test "owner should update store" do
    @user = users(:owner)
    sign_in @user
    @store = stores(:one)
    put :update, id: @store, store: { description: 'test', title: 'test' }
    assert_redirected_to store_path(assigns(:store))
  end


end

# a new reg user can do
class StoresControllerTest < ActionController::TestCase


  test "new reg user should get new" do
    @user = users(:new_reg_user)
    sign_in @user
    get :new
    assert_response :success
  end

  test "new reg user create store" do
    @user = users(:new_reg_user)
    sign_in @user
    assert_difference('Store.count') do
      post :create, store: { description: 'some', title: 'some' }
    end
  end

end
