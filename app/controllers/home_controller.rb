class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html do
        render layout: 'fix_template'
      end
    end
    
  end

end
