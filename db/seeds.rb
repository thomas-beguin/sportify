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

ADDRESS = ["26 rue de la montagne sainte genevieve",
  "68 avenue parmentier",
  "7 rue lisse des cordeliers",
  "la rotonde, aix-en-provence",
  "134 quai de bacalan, bordeaux",
  "3 rue des acacias, chartres"]

PHOTOS_URL = ["https://plus.unsplash.com/premium_photo-1664444389055-cae53b90b91c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
              "https://images.unsplash.com/photo-1531565637446-32307b194362?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
              "https://images.unsplash.com/photo-1547447134-cd3f5c716030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
              "https://images.unsplash.com/photo-1584984769572-eea0f1d6aaa7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
              "https://images.unsplash.com/photo-1615743029595-36815c8afd33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"]

puts "Creating Users"

admin_user = User.new(email: "admin@mail.com", password: "password", first_name: "Bob", last_name: "L'admin", address: Faker::Address.full_address, admin: true)
admin_user.photo.attach(io: URI.open("https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user1 = User.new(email: "client1@mail.com", password: "password", first_name: "Marie", last_name: "Sixtine", address: Faker::Address.full_address)
client_user1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user2 = User.new(email: "client2@mail.com", password: "password", first_name: "Thomas", last_name: "Pesquet", address: Faker::Address.full_address)
client_user2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

client_user3 = User.new(email: "client3@mail.com", password: "password", first_name: "Louis", last_name: "Quatorze", address: Faker::Address.full_address)
client_user3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

owner_user = User.new(email: "owner@mail.com", password: "password", first_name: "Fred", last_name: "Eric", address: Faker::Address.full_address)
owner_user.photo.attach(io: URI.open("https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"), filename: "seed.png", content_type: "image/png")

admin_user.save!
puts "Admin: #{admin_user.first_name}"
client_user1.save!
puts "Client 1: #{client_user1.first_name}"
client_user2.save!
puts "Client 2: #{client_user2.first_name}"
client_user3.save!
puts "Client 3: #{client_user3.first_name}"
owner_user.save!
puts "Owner: #{owner_user.first_name}"

puts "---------------------------------------"
puts "Creating Products and Bookings"

10.times do
  product = Product.new(
    name: NAME.sample,
    category: CATEGORY.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: CONDITION.sample,
    address: ADDRESS.sample,
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
  puts "booking saved : #{booking.user.first_name}"
end
