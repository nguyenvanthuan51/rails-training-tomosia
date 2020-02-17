class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  
  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: "Cart was successfully created"
    else
      render :new, alert: "Cart was unsuccessfully created"
    end
  end

  private

  def set_cart
    @cart = Cart.find_by_id(params[:id])
    if !@cart.present?
      redirect_to carts_path, alert: "Cart not found"
    end
  end

  def cart_params
    params.require(:cart)
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end
  
end
