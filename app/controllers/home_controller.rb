class HomeController < ApplicationController
  load_and_authorize_resource except: [:index]
  before_filter :authenticate_user!, except: [:index]

  def index
    respond_to do |format|
      format.html do
        render layout: 'index_template'
      end
    end
    
  end

  def dashboard
  end
end
