class Admin::HomeController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  layout 'admin'

  def index
    @store = current_user.store
    respond_to do |format|
      format.html
    end
    
  end

end
