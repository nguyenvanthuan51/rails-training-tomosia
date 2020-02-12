class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(PERPAGE)
  end
end
