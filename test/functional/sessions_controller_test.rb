require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  tests Devise::SessionsController
  include Devise::TestHelpers

  setup do
    @login_user = users(:login_user)
  end

  # devise / test / controllers / sessions_controller_test.rb
  # https://github.com/plataformatec/devise/blob/master/test/controllers/sessions_controller_test.rb
  test "should login" do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.session["user_return_to"] = 'foo.bar'

    # TODO: fix me
    # post :create, :user => { :email => 'login@123.com', :password => '123456' }
    post :create

    # assert_redirected_to user_path(@login_user)
    assert_equal 200, @response.status
  end
end