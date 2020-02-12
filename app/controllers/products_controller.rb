class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(PERPAGE)
  end
  
  def show
    product
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end
end
