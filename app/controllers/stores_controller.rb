class StoresController < ApplicationController
  load_and_authorize_resource except: [:show]
  before_filter :authenticate_user!, except: [:show]

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find_by_subdomain(request.subdomain)||Store.find_by_id(params[:id])||Store.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
