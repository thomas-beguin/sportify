# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

Product.destroy_all
User.destroy_all

user = User.new(email: "m@gmail.com", password: "123456")
user.save

  product = Product.new(
    name: "Ski",
    category: "Winter Sport",
    price_per_day: "20 euros",
    year_of_purchase: "2021",
    condition: "Neuf"
  )

  file = URI.open("https://s1.1zoom.me/b4340/106/Skiing_Men_Jump_Snow_513852_3840x2400.jpg")
  product.photos.attach(io: file, filename: "ski.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Paddle",
    category: "Water Sport",
    price_per_day: "10 euross",
    year_of_purchase: "2017",
    condition: "Used"
  )
  file = URI.open("https://img.static-rmg.be/a/view/q75/w/h/2321875/marco-lopez-z2jzpd0e9lo-unsplash-jpg.jpg")
  product.photos.attach(io: file, filename: "paddle.png", content_type: "image/png")
  file = URI.open("https://static.netshoes.com.br/produtos/prancha-stand-up-paddle-nautika-spk-2/64/535-0001-164/535-0001-164_zoom4.jpg?ts=1590180973&")
  product.photos.attach(io: file, filename: "paddle2.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Tennis Equipment",
    category: "Collective Sport",
    price_per_day: "15 euros",
    year_of_purchase: "2020",
    condition: "Used"
  )
  file = URI.open("https://www.espace-des-marques.com/152006-thickbox_default/raquette-de-tennis-noire-junior-babolat-ballfighter-25.jpg")
  product.photos.attach(io: file, filename: "tennis.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Soccer ball",
    category: "Collective Sport",
    price_per_day: "5.5 euros",
    year_of_purchase: "2019",
    condition: "Great quality"
  )
  file = URI.open("https://balenciaga.dam.kering.com/m/6e0b67f1dc05615e/Medium-724729T01311000_F.jpg?v=2")
  product.photos.attach(io: file, filename: "foot.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "BMX",
    category: "Outdoor Sport",
    price_per_day: "45 euros",
    year_of_purchase: "2023",
    condition: "Terrific"
  )
  file = URI.open("https://www.brosstore.fr/15944-thickbox_default/bmx-18-subrosa-tiro-black-2021.jpg")
  product.photos.attach(io: file, filename: "bmx.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Diving material",
    category: "Sea Sport",
    price_per_day: "75 euros",
    year_of_purchase: "2018",
    condition: "Good quality"
  )
  file = URI.open("https://img.class.posot.es/en_gb/2020/03/22/SCUBA-DIVING-GEAR-20200322121106.jpg")
  product.photos.attach(io: file, filename: "diving.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Basketball",
    category: "Collective Sport",
    price_per_day: "2.5 euros",
    year_of_purchase: "2020",
    condition: "Used"
  )
  file = URI.open("https://m.media-amazon.com/images/I/81HtVnVEvHL._AC_SX679_.jpg")
  product.photos.attach(io: file, filename: "basket.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!

  product = Product.new(
    name: "Tutu",
    category: "Dance",
    price_per_day: "16 euros",
    year_of_purchase: "2022",
    condition: "Good quality"
  )
  file = URI.open("https://m.media-amazon.com/images/I/81HtVnVEvHL._AC_SX679_.jpg")
  product.photos.attach(io: file, filename: "basket.png", content_type: "image/png")
  product.user = User.all.sample
  product.save!
