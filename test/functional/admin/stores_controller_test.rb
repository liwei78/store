require 'test_helper'

# every on can do
class Admin::StoresControllerTest < ActionController::TestCase

  test "everyone should show store" do
    @store = stores(:one)
    get :show, id: @store.id
    assert_response :success
  end

end

# what a owner can do
class Admin::StoresControllerTest < ActionController::TestCase

  setup do
    # NOTE: it's not necessary ????????? whyyyy????
    # request.env["devise.mapping"] = Devise.mappings[:user]
  end

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
      post :create, store: { description: 'some', title: 'some', subdomain: 'some' }
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
    put :update, id: @store, store: { description: 'test', title: 'test', subdomain: 'test' }
    assert_redirected_to admin_store_path(assigns(:store))
  end


end

# a new reg user can do
class Admin::StoresControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  test "new reg user should get new" do
    @user = users(:new_reg_user)
    sign_in @user
    get :new
    assert_response :success
  end

  test "new reg user create store" do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:new_reg_user)
    sign_in @user
    assert_difference('Store.count') do
      post :create, store: { description: 'some', title: 'some', subdomain: 'some', subdomain: 'test-domain' }
    end
    store = Store.last
    assert_equal store.user_id, @user.id
  end

end

