class Admin::ProductsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    @products = current_user.products

    respond_to do |format|
      format.html
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = current_user.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = current_user.products.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = current_user.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = current_user.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_path }
    end
  end

end
