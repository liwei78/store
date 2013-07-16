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
