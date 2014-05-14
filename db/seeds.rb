require 'factory_girl'

Dir.glob(Rails.root.to_s + "/spec/factories/*") { |file| require file }

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Foo", last_name:"Bar", user_name: "foo.bar", password: "password", email:"foo@bar.com", mobile_number_1: "38165968754")

Category.create(name:"Nocni klub")
FactoryGirl.create :active_advert
FactoryGirl.create :inactive_advert
FactoryGirl.create :uncommentable_advert

