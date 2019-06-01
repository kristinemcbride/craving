puts "Destroying current DB"

Favorite.destroy_all
Dish.destroy_all
Restaurant.destroy_all
User.destroy_all


puts "Creating 4 USERS..."

meder = User.new(
  email: "meder@meder.com",
  name: "Meder",
  password: "password"
  )
meder.remote_avatar_url = "https://res.cloudinary.com/mike-asher/image/upload/v1558709647/nj18sssnzxnuh7rvfvlx.jpg"
meder.save!

kristine = User.new(
  email: "kristine@kristine.com",
  name: "Kristine",
  password: "password"
  )
kristine.remote_avatar_url = "https://res.cloudinary.com/mike-asher/image/upload/v1558709362/q0awjfu6e1eyjso3mknm.png"
kristine.save!

ricardo = User.new(
  email: "ricardo@ricardo.com",
  name: "Ricardo",
  password: "password"
  )
ricardo.remote_avatar_url = "https://res.cloudinary.com/mike-asher/image/upload/v1558709526/x59kmstmnwclothuw9dv.jpg"
ricardo.save!

ashley = User.new(
  email: "ashley@ashley.com",
  name: "Ashley",
  password: "password"
  )
ashley.remote_avatar_url = "https://res.cloudinary.com/mike-asher/image/upload/v1558709460/l6uxxdeceq8bhb1zlvhh.jpg"
ashley.save!


puts "Creating 7 RESTAURANTS..."

koya = Restaurant.create!(
  name: "La Real Hamburguesería",
  address: "Carrer de Vic, 23, 08006 Barcelona",
  photo: "https://www.adlers-innsbruck.com/fileadmin/_processed_/6/4/csm_restaurant-img-02_d666f4932c.jpg",
  price_range: "$"
  )

ninos = Restaurant.create!(
  name: "Nino's Palace",
  address: "Carrer del Rosselló, 217, 08008 Barcelona",
  photo: "https://s3-eu-west-1.amazonaws.com/gr-cms/media/filer_public/cc/ec/ccecba57-fc3a-4b94-911a-966ab4265c40/1.jpg",
  price_range: "$$"
  )

ugarit = Restaurant.create!(
  name: "Ugarit",
  address: "Carrer de Bruniquer, 69, 08024 Barcelona",
  photo: "https://tastet.ca/wp-content/uploads/2018/10/restaurant-lexpress-montreal-3-1024x684.jpg",
  price_range: "$$"
  )

apotheosik = Restaurant.create!(
  name: "Apotheosik",
  address: "Carrer de la Legalitat, 74, 08024 Barcelona",
  photo: "https://naosusu.com/wp-content/uploads/2018/07/Popular-and-best-restaurants-in-Warri.jpg",
  price_range: "$$$"
  )

barco = Restaurant.create!(
  name: "El Barco",
  address: "Av. Ricardo Soriano, 32, 29601 Marbella, Málaga",
  photo: "https://i.imgur.com/NBBtwTj.jpg",
  price_range: "$$"
  )

meder_place = Restaurant.create!(
  name: "Meder's Corner",
  address: "Av Calderón de la Barca, 29660 Marbella, Málaga",
  photo: "https://www.sanantonio-santorini.com/wp-content/uploads/2016/03/restaurant-top-image1.jpg",
  price_range: "$$$$"
  )

koya_2 = Restaurant.create!(
  name: "La Real Hamburguesería",
  address: "Calle Gran Vía, 44, 28013 Madrid",
  photo: "https://www.adlers-innsbruck.com/fileadmin/_processed_/6/4/csm_restaurant-img-02_d666f4932c.jpg",
  price_range: "$"
  )


puts "Creating 15 DISHES..."

osaka = Dish.new(
  name: "Osaka Burger",
  price: 12,
  rating: 4,
  category: "Burger",
  user_id: ashley.id,
  restaurant_id: apotheosik.id,
  )
osaka.remote_photo_url = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/burgerbear-077-1515519914.jpg"
osaka.save!

tom_yum = Dish.new(
  name: "Tom Yum Goong",
  price: 8,
  rating: 3,
  category: "Thai Soup",
  user_id: ashley.id,
  restaurant_id: apotheosik.id,
  )
tom_yum.remote_photo_url = "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/best_and_worst_thai_dishes_slideshow/1800x1200_slideshow_best_and_worst_thai_dishes_for_your_health.jpg"
tom_yum.save!

cheese_bacon = Dish.new(
  name: "Bacon Cheeseburger",
  price: 14,
  rating: 5,
  category: "Burger",
  user_id: ashley.id,
  restaurant_id: koya.id,
  )
cheese_bacon.remote_photo_url = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/burgerbear-077-1515519914.jpg"
cheese_bacon.save!

deluxe = Dish.new(
  name: "Deluxe Burger",
  price: 15,
  rating: 4,
  category: "Burger",
  user_id: kristine.id,
  restaurant_id: koya.id,
  )
deluxe.remote_photo_url = "https://sifu.unileversolutions.com/image/en-SA/recipe-topvisual/2/1260-709/steakhouse-burger-50391476.jpg"
deluxe.save!

pasta = Dish.new(
  name: "Spagetti & Meatballs",
  price: 16,
  rating: 3,
  category: "Pasta",
  user_id: kristine.id,
  restaurant_id: koya.id,
  )
pasta.remote_photo_url = "https://hips.hearstapps.com/delish/assets/17/39/1506456062-delish-spaghetti-meatballs.jpg"
pasta.save!

fries = Dish.new(
  name: "French Fries",
  price: 6,
  rating: 5,
  category: "Fries",
  user_id: kristine.id,
  restaurant_id: koya.id,
  )
fries.remote_photo_url = "https://static.olocdn.net/menu/applebees/d5d7db22de398d29f1d444cc550d8f58.jpg"
fries.save!

wings = Dish.new(
  name: "Sesame Wings",
  price: 10,
  rating: 4,
  category: "Wings",
  user_id: kristine.id,
  restaurant_id: koya.id,
  )
wings.remote_photo_url = "https://www.simplyrecipes.com/wp-content/uploads/2019/01/PC-Teriyaki-Chicken-LEAD-3.jpg"
wings.save!

grilled_chicken = Dish.new(
  name: "Grilled Chicken",
  price: 10,
  rating: 3,
  category: "Chicken",
  user_id: kristine.id,
  restaurant_id: ninos.id,
  )
grilled_chicken.remote_photo_url = "http://img.finedininglovers.com/?img=http%3A%2F%2Ffinedininglovers.cdn.crosscast-system.com%2FBlogPost%2FOriginal_10367_grilled-chicken.jpg&w=1200&h=660&lu=1430276710&ext=.jpg"
grilled_chicken.save!

grilled_salmon = Dish.new(
  name: "Grilled Salmon",
  price: 16,
  rating: 5,
  category: "Salmon",
  user_id: kristine.id,
  restaurant_id: apotheosik.id,
  )
grilled_salmon.remote_photo_url = "https://www.seriouseats.com/recipes/images/2015/08/20150823-grilled-chicken-cutlet-recipe-kenji-01.jpg"
grilled_salmon.save!

grilled_salmon_2 = Dish.new(
  name: "Grilled Salmon",
  price: 15,
  rating: 4,
  category: "Salmon",
  user_id: ricardo.id,
  restaurant_id: koya.id,
  )
grilled_salmon_2.remote_photo_url = "https://4.bp.blogspot.com/--92q6Bbi4Qw/XFIUhUMt2fI/AAAAAAAAABE/Om9MUeaV2mggiUC7gGiVxgDWigehfMMtwCLcBGAs/s1600/Webp.net-compress-image.jpg"
grilled_salmon_2.save!

steak_1 = Dish.new(
  name: "Grilled Steak",
  price: 18,
  rating: 4,
  category: "Steak",
  user_id: ricardo.id,
  restaurant_id: ugarit.id,
  )
steak_1.remote_photo_url = "https://cdn.therockpoolfiles.com/therockpoolfiles/wp-content/uploads/sites/4/2017/01/27000243/Rockpool-Bar-Grill-signature-steak.jpg"
steak_1.save!

grilled_salmon_3 = Dish.new(
  name: "Grilled Salmon",
  price: 15,
  rating: 5,
  category: "Salmon",
  user_id: meder.id,
  restaurant_id: meder_place.id,
  )
grilled_salmon_3.remote_photo_url = "https://hips.hearstapps.com/delish/assets/17/39/1506456157-delish-honey-garlic-glazed-salmon-1.jpg"
grilled_salmon_3.save!

steak_2 = Dish.new(
  name: "Grilled Steak",
  price: 18,
  rating: 4,
  category: "Steak",
  user_id: meder.id,
  restaurant_id: barco.id,
  )
steak_2.remote_photo_url = "https://d1doqjmisr497k.cloudfront.net/-/media/ducrosfr-2016/recipes/2000/steak_au_vin_rouge_et_aux_echalotes_2000.ashx?vd=20180616T221321Z&hash=7E38BEBBD02FF8A73CDD064FA5868EA6E45DFA82"
steak_2.save!

cheese_bacon_2 = Dish.new(
  name: "Bacon Cheeseburger",
  price: 14,
  rating: 5,
  category: "Burger",
  user_id: kristine.id,
  restaurant_id: koya_2.id,
  )
cheese_bacon_2.remote_photo_url = "https://logansroadhouse.com/wp-content/uploads/2017/01/Website-Carousel_FriedCheeseburger.jpg"
cheese_bacon_2.save!

deluxe_2 = Dish.new(
  name: "Deluxe Burger",
  price: 15,
  rating: 4,
  category: "Burger",
  user_id: meder.id,
  restaurant_id: koya_2.id,
  )
deluxe_2.remote_photo_url = "https://www.cscassets.com/ca/recipes/medium/medium_774.jpg"
deluxe_2.save!


puts "Creating 4 REVIEWS"

review_1 = Review.create!(
  content: "This hamburger changed my life, i'm now a vegan.",
  rating: 3,
  date: "2018-05-25",
  user_id: ashley.id,
  dish_id: deluxe.id
  )

review_2 = Review.create!(
  content: "I'm getting married here, thanks to this burger.",
  rating: 5,
  date: "2019-04-20",
  user_id: ricardo.id,
  dish_id: deluxe.id
  )

review_3 = Review.create!(
  content: "The place could be burning down, and I would still finish this burger",
  rating: 5,
  date: "2018-12-31",
  user_id: kristine.id,
  dish_id: deluxe.id
  )

review_4 = Review.create!(
  content: "Pleasant surprise, I was a vegan until I was tricked to try this burger, now I order one each day",
  rating: 5,
  date: "2019-05-29",
  user_id: meder.id,
  dish_id: deluxe.id
  )


puts "Creating 4 FAVORITES"

favorite_1 = Favorite.create!(
  user_id: kristine.id,
  dish_id: deluxe.id
  )

favorite_2 = Favorite.create!(
  user_id: kristine.id,
  dish_id: steak_2.id
  )

favorite_3 = Favorite.create!(
  user_id: kristine.id,
  dish_id: grilled_chicken.id
  )

favorite_4 = Favorite.create!(
  user_id: kristine.id,
  dish_id: tom_yum.id
  )

