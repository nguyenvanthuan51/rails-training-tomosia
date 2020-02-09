class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, foreign_key: :product_id
end
