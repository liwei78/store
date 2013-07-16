class Admin::ShippmentsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  # GET /shippments
  # GET /shippments.json
  def index
    @shippments = Shippment.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /shippments/1
  # GET /shippments/1.json
  def show
    @shippment = Shippment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /shippments/new
  # GET /shippments/new.json
  def new
    @shippment = Shippment.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /shippments/1/edit
  def edit
    @shippment = Shippment.find(params[:id])
  end

  # POST /shippments
  # POST /shippments.json
  def create
    @shippment = Shippment.new(params[:shippment])

    respond_to do |format|
      if @shippment.save
        format.html { redirect_to admin_shippment_path(@shippment), notice: 'Shippment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /shippments/1
  # PUT /shippments/1.json
  def update
    @shippment = Shippment.find(params[:id])

    respond_to do |format|
      if @shippment.update_attributes(params[:shippment])
        format.html { redirect_to admin_shippment_path(@shippment), notice: 'Shippment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /shippments/1
  # DELETE /shippments/1.json
  def destroy
    @shippment = Shippment.find(params[:id])
    @shippment.destroy

    respond_to do |format|
      format.html { redirect_to admin_shippments_url }
    end
  end
end
