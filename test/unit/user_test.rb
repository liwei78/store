require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "USER CREATE TRIGGER" do
    User.create(email: 'xxx@123.com', password: '123456')
    p ActiveRecord::Base.connection.select_all("select * from users_log")
  end
end
