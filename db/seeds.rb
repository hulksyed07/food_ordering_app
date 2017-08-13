# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create([{email: 'test1@test.com'}, {email: 'test2@test.com'}])

Category.create([{ name: 'Indian' }, { name: 'Chinese' }, { name: 'Desserts' }, { name: 'Starters' }, { name: 'Appetizers' }, { name: 'Cakes' }])

categories = Category.all

categories.each_with_index do |category, i|
	category.foods.create([{name: "#{category.name}Food_#{i+1}", price: 100}, {name: "#{category.name}Food_#{i+2}", price: 80},
		{name: "#{category.name}Food_#{i+3}", price: 120}, {name: "#{category.name}Food_#{i+4}", price: 230}])
end

OrderStatus.create([{ name: 'Draft' }, { name: 'Submitted' }, { name: 'Delivered' }])