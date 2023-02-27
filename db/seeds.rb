# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating 20 prodcuts'
20.times do
  product = Product.create(
    name: "Paddle",
    photo: "https://www.bing.com/images/search?view=detailV2&ccid=vR%2FMyJhG&id=4BDDD1F5EA9D17A8124118C062C7B285CB929BA9&thid=OIP.vR_MyJhGi9CtvpEcyfbAygHaE8&mediaurl=https%3A%2F%2Fimg.static-rmg.be%2Fa%2Fview%2Fq75%2Fw%2Fh%2F2321875%2Fmarco-lopez-z2jzpd0e9lo-unsplash-jpg.jpg&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.bd1fccc898468bd0adbe911cc9f6c0ca%3Frik%3DqZuSy4Wyx2LAGA%26pid%3DImgRaw%26r%3D0&exph=3648&expw=5472&q=paddle&simid=607990889538597322&form=IRPRST&ck=EC47F89D3E6D348DA426D3FAFBD72060&selectedindex=16&ajaxhist=0&ajaxserp=0&vt=0&sim=11",
    description: "Brand new paddle",
    rating:  rand(0..5)
  )
  product.save!
end
puts 'Finished!'
