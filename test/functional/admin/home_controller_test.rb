require 'test_helper'

class Admin::HomeControllerTest < ActionController::TestCase

  setup do
    @owner = users(:owner)
    sign_in @owner
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template 'index'
  end

end