# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating 2 fake users...'
2.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 10 fake toys...'
10.times do
  toy = Toy.new(
    name: Faker::Creature::Animal.name,
    description: "A beautiful harmless toy for your kids",
    cuteness: rand(5..10),
    kid_friendly: true,
    price_daily: rand(1..99),
    location: Toy::CITIES.sample,
    soul_taking_chance: rand(95..100),
    user_id: rand(1..2)
  )
  toy.save!
end
puts 'Finished!'
