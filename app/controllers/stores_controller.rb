class StoresController < ApplicationController
  load_and_authorize_resource except: [:show]
  before_filter :authenticate_user!, except: [:show]

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find_by_id(params[:id])||Store.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store }
    end
  end

  # GET /stores/new
  # GET /stores/new.json
  def new
    @store = Store.new

    respond_to do |format|
      format.html { render layout: 'fix_template'}
    end
  end

  # GET /stores/1/edit
  def edit
    @store = Store.find(params[:id])
    respond_to do |format|
      format.html { render layout: 'fix_template'}
    end
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(params[:store])
    # TODO: er............I like session[:user_id]
    # @store.user_id = current_user.id
    respond_to do |format|
      if @store.save

        @store.update_attribute(:user_id, current_user.id)
        current_user.update_attributes(owner: true, store_id: @store.id)

        format.html { redirect_to store_path(@store.permalink), notice: 'Store was successfully created.' }
      else
        format.html { render action: "new", layout: 'fix_template' }
      end
    end
  end

  # PUT /stores/1
  # PUT /stores/1.json
  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(params[:store])
        format.html { redirect_to store_path(@store.permalink), notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: 'fix_template' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end


end
