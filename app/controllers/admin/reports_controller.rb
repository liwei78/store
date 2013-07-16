class Admin::ReportsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.html
    end
    
  end

end
