class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]
  def index
    @cart_items = CartItem.all
  end

  def show
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    unless product
      flash[:alert] = "Product not found"
    end
    @cart_item = @cart.add_product(product)
    if @cart_item.save
      redirect_to @cart_item.cart, notice: "Item added to cart"
    else
      render :new
    end

  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
    unless @cart_item
      flash[:alert] = "Cart item not found"
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end
end
