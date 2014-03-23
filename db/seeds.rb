require 'factory_girl'

Dir.glob(Rails.root.to_s + "/spec/factories/*") { |file| require file }

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "User1", last_name:"User1", user_name: "User", password: "password", email:"user@hh.com",mobile_number_1: "38165968754")
puts "Successeful created user"
Category.create(name:"Nocni klub")
FactoryGirl.create :active_advert
FactoryGirl.create :inactive_advert
