require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'jose@tinder.com',password: 'jose' )

Category.create!(name: "Housing")
Category.create!(name: "Auto")
Category.create!(name: "Singles Looking for fun")
Category.create!(name: "Bikes")
Category.create!(name: "FUrniture")
Category.create!(name: "Electronics")
Category.create!(name: "Fruit")

Category.all.each do |category|
	10.times do Article.create!(title: Faker::Lorem.sentence, 
		                        body: Faker::Lorem.paragraph,
		                        category: category)
	end
end