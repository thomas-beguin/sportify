require "open-uri"

puts "Destroying..."

User.destroy_all
Product.destroy_all
Booking.destroy_all

puts "User : #{User.all.length}"
puts "Product : #{Product.all.length}"
puts "Booking : #{Booking.all.length}"

puts "---------------------------------------"

NAME = %w[ski raquette snow clubs roller frisbee]
CATEGORY = %w[tennis basketball football golf outdoor indoor]
PRICE = %w[10 20 15 12.5 8.5 30 100 3]
YEAR = %w[2000 2010 2022 2020]
CONDITION = %w[bad ok good new]
PHOTOS_URL = ["https://s1.1zoom.me/b4340/106/Skiing_Men_Jump_Snow_513852_3840x2400.jpg",
          "https://img.static-rmg.be/a/view/q75/w/h/2321875/marco-lopez-z2jzpd0e9lo-unsplash-jpg.jpg",
          "https://www.espace-des-marques.com/152006-thickbox_default/raquette-de-tennis-noire-junior-babolat-ballfighter-25.jpg",
          "https://balenciaga.dam.kering.com/m/6e0b67f1dc05615e/Medium-724729T01311000_F.jpg?v=2"]

puts "Creating Users"

admin_user   = User.new(email: "admin@mail.com",   password: "password", first_name: "Bob",    last_name: "L'admin",  address: Faker::Address.full_address, admin: true)
client_user1 = User.new(email: "client1@mail.com", password: "password", first_name: "Marie",  last_name: "Sixtine",  address: Faker::Address.full_address)
client_user2 = User.new(email: "client2@mail.com", password: "password", first_name: "Thomas", last_name: "Pesquet",  address: Faker::Address.full_address)
client_user3 = User.new(email: "client3@mail.com", password: "password", first_name: "Louis",  last_name: "Quatorze", address: Faker::Address.full_address)
owner_user   = User.new(email: "owner@mail.com",   password: "password", first_name: "Fred",   last_name: "Eric",     address: Faker::Address.full_address)

admin_user.save!
puts "Admin: #{admin_user}"
client_user1.save!
puts "Client 1: #{client_user1}"
client_user2.save!
puts "Client 2: #{client_user2}"
client_user3.save!
puts "Client 3: #{client_user3}"
owner_user.save!
puts "Owner: #{owner_user}"

puts "---------------------------------------"
puts "Creating Products and Bookings"

10.times do
  product = Product.new(
    name: NAME.sample,
    category: CATEGORY.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: CONDITION.sample
  )
  PHOTOS_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = owner_user
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user2, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.email}"
end
