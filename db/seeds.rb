# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating 2 fake users...'
User.delete_all
Toy.delete_all

2.times do
  @user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  @user.save!
end
puts 'Finished!'

puts 'Creating 10 fake toys...'

#if you want to change names --> change photo name too. Also make sure chars are < 15 otherwise no validation
names = ["Baby",
  "The Accident",
   "Car",
   "Ouja Barbie",
   "Meat Market",
   "Skinny Bones",
   "Teddy",
   "Pink Thing",
   "Crazy Ape",
   "Satanic Priest"
  ]

10.times do
  toy = Toy.new(
    name: names.sample,
    description: "A beautiful harmless toy for your kids",
    # photo: File.open(File.join(Rails.root, "/app/assets/images/toys/#{rand(1..7)}.jpeg")),
    cuteness: rand(1..5),
    kid_friendly: true,
    price_daily: rand(1..99),
    address: Toy::CITIES.sample,
    soul_taking_chance: rand(1..99),
    user_id: @user[:id]
  )
  toy.photo.attach(io: File.open(Rails.root.join("app/assets/images/toys/#{toy.name}.jpeg")),
                  filename: 'toy.jpeg')
  toy.save!
end
puts 'Finished!'
