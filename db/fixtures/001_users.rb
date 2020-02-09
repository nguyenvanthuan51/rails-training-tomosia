User.seed do |s|
  s.id    = 1
  s.email = "guest@example.com"
  s.password_digest = "123123"
end

User.seed do |s|
  s.id    = 2
  s.email = "admin@example.com"
  s.password_digest = "123123"
end

User.seed do |s|
  s.id    = 3
  s.email = "mod@example.com"
  s.password_digest = "123123"
end