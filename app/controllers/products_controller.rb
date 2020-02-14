class ProductsController < ApplicationController
  before_action :product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit, :show]
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
