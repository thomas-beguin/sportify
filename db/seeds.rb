User.destroy_all
Product.destroy_all

# user = User.new(first_name: "Bob",
#                 last_name: "Dupont",
#                 address: "14 rue du paradis, 75001 Paris",
#                 email: "bob.dupont@mail.com",
#                 password: "password")
user = User.new(email: "bob.dupont@mail.com",
                password: "password")

user.save!

PRODUCTS = ["Golf clubs", "Surfboard", "Ski", "Wakeboard", "Bike"]
CATEGORY = ["Golf", "Tennis", "Ping pong", "Surf"]
CONDITION = ["New", "Good", "Ok"]
PRICE = [10, 30, 25, 75, 33]

20.times do
  product = Product.new(name: PRODUCTS.sample, category: CATEGORY.sample, price_per_day: PRICE.sample, year_of_purchase: 2020, condition: CONDITION.sample)
  product.user = user
  product.save!
  puts product
end
