50.times do |n|
  Product.seed do |s|
    s.id    = n
    s.name = Faker::App.unique.name
    s.price = "100#{n}".to_i
  end
end