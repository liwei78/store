class ProductsController < ApplicationController
  load_and_authorize_resource except: [:show]
  before_filter :authenticate_user!, except: [:show]
  before_filter :find_store
  # GET /products
  # GET /products.json
  def index
    @products = @store.products

    respond_to do |format|
      format.html { render layout: 'fix_template'}
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = @store.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = @store.products.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = @store.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @store.products.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to store_product_path(@store, @product), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = @store.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to store_product_path(@store, @product), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = @store.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to store_products_url(@store) }
      format.json { head :no_content }
    end
  end

  def add_cart
    @product = @store.products.find(params[:id])
    current_user.cart_products << @product
    respond_to do |format|
      format.js
    end
  end

  private

  def find_store
    @store = Store.find_by_id(params[:store_id])||Store.find_by_permalink(params[:store_id])
  end

end
