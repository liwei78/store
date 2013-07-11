class ShippmentsController < ApplicationController
  load_and_authorize_resource
  # GET /shippments
  # GET /shippments.json
  def index
    @shippments = Shippment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shippments }
    end
  end

  # GET /shippments/1
  # GET /shippments/1.json
  def show
    @shippment = Shippment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shippment }
    end
  end

  # GET /shippments/new
  # GET /shippments/new.json
  def new
    @shippment = Shippment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shippment }
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
        format.html { redirect_to @shippment, notice: 'Shippment was successfully created.' }
        format.json { render json: @shippment, status: :created, location: @shippment }
      else
        format.html { render action: "new" }
        format.json { render json: @shippment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shippments/1
  # PUT /shippments/1.json
  def update
    @shippment = Shippment.find(params[:id])

    respond_to do |format|
      if @shippment.update_attributes(params[:shippment])
        format.html { redirect_to @shippment, notice: 'Shippment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shippment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippments/1
  # DELETE /shippments/1.json
  def destroy
    @shippment = Shippment.find(params[:id])
    @shippment.destroy

    respond_to do |format|
      format.html { redirect_to shippments_url }
      format.json { head :no_content }
    end
  end
end
