# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create(first_name: "User1", last_name:"User1", user_name: "User", password: "password", email:"user@hh.com",mobile_number_1: "38165968754")
puts "Successeful created user"
c = Category.create(name:"Nocni klub")
addvert = Advert.create(
												title: "Kokteli na snizenju", 
												description: "Svi kokteli posle 19h na snizenju od 10%-30%",
												address: "Cara Dusana 12",
												location: "Zemun",
												phone_number: "11111111",
												user: u,
												category: c
												 )
