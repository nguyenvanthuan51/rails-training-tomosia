module CurrentCart
  
  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
  end
end