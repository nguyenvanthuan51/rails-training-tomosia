class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
  end
end
