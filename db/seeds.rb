# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
type_names = ["Purchase", "Transer" , "Withdrawal" , "Payment" ]
category_names = ["Car" , "Grocery", "Home", "Personal", "Services", "Restaurants", "Fun" , "Travel", "Edutacion", "Others"]

type_names.each  do |c|
	name = c
	Type.create!(name: name)
end


category_names.each  do |c|
	name = c
	Categorye.create!(name: name)
end



100.times do |c|
	concept = Faker::Lorem.sentence
	date = Faker::Date.between(1.year.ago, Date.today)
	type_id = Faker::Number.between(1, 4)
	categorye_id = Faker::Number.between(1, 10)
	amount = Faker::Number.between(1000, 500000)
	Expense.create!(concept: concept,
					date: date,
					type_id: type_id,
					categorye_id: categorye_id,
					amount: amount
		)
end



