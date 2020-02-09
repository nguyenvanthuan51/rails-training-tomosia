# Get all ids product
product_ids = Product.ids

# Create cart with billing paid
10.times do |n|
  User.all.each do |user|
    ActiveRecord::Base.transaction do
      cart = user.carts.create! completed_at: true
      cart.cart_items.create! product_id: product_ids.sample
    end
  end
end

# Create cart with billing unpaid
User.all.each do |user|
  ActiveRecord::Base.transaction do
    cart = user.carts.create! completed_at: false
    cart.cart_items.create! product_id: product_ids.sample
  end
end