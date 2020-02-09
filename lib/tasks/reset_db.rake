namespace :db do
  task :reset do
    User.destroy_all!
    Cart.destroy_all!
    Product.destroy_all!
  end
end
