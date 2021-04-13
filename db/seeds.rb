#! Seeding Instructions:
#? Before seeding the database:
# Run bundle install in the terminal to ensure all gem dependencies are met.
# Postgresql must be installed and running.

#? seeding the database:
# If this is your first time seeding:
# rails db:create
# rails db:migrate
# rails db:seed
# Else if existing database:
# rails db:reset #!this will drop, create, run migrations and seed#!

require "rest-client"
require "json"
require "pry"
require "faker"

def seed_users
  10.times do
    name = Faker::Movies::PrincessBride.character
    new_user = User.new(username: name.split(" ").join(""), password: "1234")
    new_user.save
    Artist.create(name: name.split(" ").join(""), user_id: new_user[:id])
  end
end

def seed_art
  # file = open('./db/art.json')
  # json = file.read
  # parsed = JSON.parse(json)
  # parsed.each do |variable|

  random = User.all.sample
  comments = ["Beautiful.", "Very nice.", "Cooooool.", "Wow this is art.", "Perfection."]
  categories = ["Cool Things", "The color red", "Heavy stuff", "Ocean"]
  category = Category.find_or_create_by(name: categories.sample)

  # in theory this will create new art
  100.times do newart = Art.create(
    user_id: random[:id],
    artist_id: random[:id],
    category_id: category[:id],
    for_sale: false,
    likes: 0,
    slug: "a-work-of-art",
    description: "a work of art",
    caption: "Moisture is the essence of wetness",
    value: rand(1..100),
    link: "www.nftgram.io",
  )
    Comment.create(comment: comments.sample, user_id: User.all.sample[:id], art_id: newart[:id])   end
end

seed_users
seed_art
