class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(PERPAGE)
  end
  
  def show
    get_product
  end

  private

  def get_product
    @get_product = Product.find(params[:id])
  end
end
