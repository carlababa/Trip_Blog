# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

carla = User.create({email: "carla@test.com", password: "123456"})
maria = User.create({email: "maria@test.com", password: "123456"})
john = User.create({email: "john@test.com", password: "123456"})

puts "Seeded #{User.count} users"

tags = [
   "Asia",
   "Europe",
   "South America",
   "North America",
   "Central America",
   "Oceania",
   "By car",
   "By train",
   "Bike trip",
   "Historical",
   "Nature",
   "Night life",
   "Culture",
   "Urban"
 ]

tags.each do |tag_name|
   tag = Tag.create( name: tag_name )
end
