# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.where(name: "job").first_or_create
Category.where(name: "john").first_or_create
Category.where(name: "sheena").first_or_create
Category.where(name: "shelly").first_or_create



# User.where(first_name: "job").first_or_create
# User.where(last_name: "shah").first_or_create
# User.where(age: 67).first_or_create
# User.where(mobile_number: 3456789123).first_or_create