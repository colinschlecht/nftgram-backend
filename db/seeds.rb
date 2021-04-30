require "rest-client"
require "json"
require "pry"
require "faker"

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
# rails db:reset  >>(#?this will drop, create, run migrations and seed)


def seed_users
  10.times do
    name = Faker::Movies::PrincessBride.character
    new_user = User.new(username: name.split(" ").join(""), password: "1234")
    new_user.save
    Artist.create(name: name.split(" ").join(""), user_id: new_user[:id])
  end
end

#### if seeding from a json file
#   # file = open('./db/seeddatafile.json')
#   # json = file.read
#   # parsed = JSON.parse(json)
#   # parsed.each do |variable|
#   # yourcodehere
#   # end

def seed_art
  ### generates seed art
  100.times do 
    categories = ["Cool Things", "The color red", "Heavy stuff", "Ocean"]
    category = Category.find_or_create_by(name: categories.sample)
    random = User.all.sample
    newart = Art.create(
    user_id: random[:id],
    artist_id: random[:id],
    category_id: category[:id],
    for_sale: false,
    slug: "a-work-of-art",
    description: "a work of art",
    caption: category[:name],
    value: rand(1..100),
    link: "www.nftgram.io"
  )
    user_length = User.all.length
    art_length = Art.all.length
    random_number_art = rand(1..art_length)
    random_number_user = rand(1..user_length)
    comments = ["Beautiful.", "Very nice.", "Cooooool.", "Wow this is art.", "Perfection."]
    ### generates art likes
    Like.create(user_id: random_number_user, likeable_type: "Art", likeable_id: random_number_art)
    ### generates art comments
    Comment.create(comment: comments.sample, user_id: User.all.sample[:id], commentable_id: newart[:id], commentable_type: 'Art')   end
end

# seed_users
# seed_art
