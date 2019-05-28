# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying current DB"

Favorite.destroy_all
Dish.destroy_all
Restaurant.destroy_all
User.destroy_all


puts "Creating USERS..."

meder = User.create!(
  email: "meder@meder.com",
  name: "Meder"
  password: "password",
  avatar: open("https://res.cloudinary.com/mike-asher/image/upload/v1558622915/ukezkpbjfxh6ensucpk0.jpg")
  )


kristine = User.create!(
  email: "kristine@kristine.com",
  name: "Kristine",
  password: "password",
  avatar: open("https://res.cloudinary.com/mike-asher/image/upload/v1558625747/kristine_hu9g6f.png")
  )

ricardo = User.create!(
  email: "ricardo@ricardo.com",
  name: "Ricardo",
  password: "password",
  avatar: open("https://res.cloudinary.com/mike-asher/image/upload/v1558625527/ricardo_vbuhcm.jpg")
  )

ashley = User.create!(
  email: "ashley@ashley.com",
  name: "Ashley",
  password: "password",
  avatar: open("https://res.cloudinary.com/mike-asher/image/upload/v1558625095/ashley_bm1krp.jpg")
  )

puts "Creating RESTAURANTS..."

koya = Restaurant.new(

  )

puts "Creating DISHES..."

osaka = Dish.new(
  name: "Osaka Burger",
  photo: open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/burgerbear-077-1515519914.jpg"),
  price: 12,
  rating: 4,
  category: "Burger",

  )
