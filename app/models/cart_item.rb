class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, foreign_key: :product_id

  def sub_total
    product.price.to_i * quantity.to_i
  end
end
