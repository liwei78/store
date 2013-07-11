class ApplicationController < ActionController::Base
  protect_from_forgery

  # devise method
  before_filter :authenticate_user!
end
