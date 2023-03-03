require "open-uri"

puts "Destroying..."

Booking.destroy_all
Product.destroy_all
User.destroy_all

puts "User : #{User.all.length}"
puts "Product : #{Product.all.length}"
puts "Booking : #{Booking.all.length}"

puts "---------------------------------------"

PRICE = %w[10 20 15 12.5 8.5 30 100 3 99]
YEAR = %w[2000 2010 2022 2020]

CONDITION = %w[bad ok good new]

ADDRESS = ["26 rue de la montagne sainte genevieve",
  "68 avenue parmentier",
  "7 rue lisse des cordeliers",
  "la rotonde, aix-en-provence",
  "134 quai de bacalan, bordeaux",
  "3 rue des acacias, chartres"]

PHOTOS_SKATE_URL = ["https://plus.unsplash.com/premium_photo-1664444389055-cae53b90b91c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1531565637446-32307b194362?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2thdGVib2FyZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1547447134-cd3f5c716030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1584984769572-eea0f1d6aaa7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1615743029595-36815c8afd33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHNrYXRlYm9hcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"]

PHOTOS_SNOW_URL = ["https://olympique.ca/wp-content/uploads/sites/2/2018/01/snowboard-slopestyle_header.jpg?resize=280",
"https://www.vienna.at/2013/11/DAB4784-20110122-600x358.jpg",
"https://www.thoughtco.com/thmb/n5r0FuyIfzKCNe7Y548T07oTfRA=/5184x3456/filters:fill(auto,1)/snowboard-at-dusk-56a88f265f9b58b7d0f3534f.jpg",
"https://i.pinimg.com/originals/b9/b3/36/b9b33682ed4215ebdfdbf3c11df3e16a.jpg",
"https://images.unsplash.com/photo-1498146831523-fbe41acdc5ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"]

PHOTOS_TENNIS_URL = ["https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
"https://images.unsplash.com/photo-1554068865-24cecd4e34b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/flagged/photo-1576972405668-2d020a01cbfa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
"https://images.unsplash.com/photo-1544298621-a28c00544483?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=689&q=80",
"https://images.unsplash.com/photo-1599586120162-c282f39edd1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"]

PHOTOS_ROLLER_URL = ["https://images.unsplash.com/photo-1578057183197-423269e14014?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1596100830041-48140de800fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1596706696066-99a44cc64e0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1708&q=80",
"https://images.unsplash.com/photo-1571032800240-1cc2e680b00c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
"https://images.unsplash.com/photo-1622640338505-2ad7465bda17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80"]

PHOTOS_FRISBEE_URL = ["https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
  "https://images.unsplash.com/photo-1601831974284-7cba02cd2887?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
  "https://images.unsplash.com/photo-1535101569105-5426f351c50b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1637121465756-a0b81c1a8270?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1583425476569-817e927a02ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1858&q=80"]

PHOTOS_GOLF_URL = ["https://images.unsplash.com/photo-1535131749006-b7f58c99034b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1591491719565-9cae8fd89f8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1568229654980-91010242b5e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1592919505780-303950717480?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80"]

PHOTOS_SKI_URL = ["https://images.unsplash.com/photo-1565992441121-4367c2967103?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80",
"https://images.unsplash.com/photo-1535640597419-853d35e6364f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
"https://images.unsplash.com/photo-1551524559-8af4e6624178?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80",
"https://plus.unsplash.com/premium_photo-1669907525782-fd4a82781f24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1613420365631-c588e7cac611?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"]

PHOTOS_PINGPONG_URL = ["https://images.unsplash.com/photo-1609710228159-0fa9bd7c0827?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1558433916-90a36b44753f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1624936188350-883a61a44116?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1633976028232-38008cedf8e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
"https://images.unsplash.com/photo-1584813539806-2538b8d918c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"]

PHOTOS_CLIMBING_URL = ["https://images.unsplash.com/photo-1601224748193-d24f166b5c77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
"https://images.unsplash.com/photo-1522163182402-834f871fd851?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1103&q=80",
"https://images.unsplash.com/photo-1586627161720-ee2849303aee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1597250861267-429663f244a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1605548109944-9040d0972bf5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"]

PHOTOS_BIKE_URL = ["https://images.unsplash.com/photo-1576858574144-9ae1ebcf5ae5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
"https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1446057633965-55d2dcb22598?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1948&q=80",
"https://images.unsplash.com/photo-1553105659-d918b253f0f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80"]

PHOTOS_RUGBY_URL = ["https://images.unsplash.com/photo-1480099225005-2513c8947aec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1603&q=80",
"https://plus.unsplash.com/premium_photo-1667598736367-123733f98c9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1558151507-c1aa3d917dbb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1604689370687-930b15f59a79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
"https://images.unsplash.com/photo-1574602904329-56e2f95fb15e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"]

PHOTOS_SURF_URL = ["https://images.unsplash.com/photo-1531722569936-825d3dd91b15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1537519646099-335112f03225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1502680390469-be75c86b636f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
"https://images.unsplash.com/photo-1527731149372-fae504a1185f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
"https://images.unsplash.com/photo-1616449973117-0e1d99c56ed3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"]

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

2.times do

  product = Product.new(
    name: "SNOW",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_SNOW_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user1
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user2, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "SKATE",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_SKATE_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user2
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "SURF",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_SURF_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user3
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user2].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "GOLF",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_GOLF_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user2
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "RUGBY",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_RUGBY_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user3
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user2].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"

  product = Product.new(
    name: "ROLLER",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_ROLLER_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user1
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user2, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "BIKE",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_BIKE_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user2
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "PING-PONG",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_PINGPONG_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user3
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user2].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"

  product = Product.new(
    name: "CLIMBING",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_CLIMBING_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user1
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user2, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "FRISBEE",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_FRISBEE_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user3
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user2].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "TENNIS",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_TENNIS_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user2
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user1, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"


  product = Product.new(
    name: "SKI",
    category: Product::CATEGORY.sample,
    sport: Product::SPORT.sample,
    price_per_day: PRICE.sample,
    year_of_purchase: YEAR.sample,
    condition: Product::CONDITION.sample,
    address: ADDRESS.sample,
  )
  PHOTOS_SKI_URL.shuffle.each { |url| product.photos.attach(io: URI.open(url), filename: "seed.png", content_type: "image/png") }
  product.user = client_user1
  product.save!
  puts "product saved : #{product.name}"

  date_start = Date.new(2022, 2, rand(1..9))
  date_end = Date.new(2022, 2, rand(10..28))
  booking = Booking.new(start_date: date_start,
                        end_date: date_end,
                        price: product.price_per_day * (date_end - date_start).to_i)
  booking.user = [client_user2, client_user3].sample
  booking.product = product
  booking.save!
  puts "booking saved : #{booking.user.first_name}"

end
