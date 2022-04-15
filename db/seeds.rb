# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: "John" , email: "aa@aaa.com" , age: 22,gender: "Male",phone_number: "0712345678")
User.create(name: "Alexandra" , email: "alexandra@aaa.com" , age: 19,gender: "Female",phone_number: "0741215515")
User.create(name: "Mike" , email: "mike@aaa.com" , age: 18,gender: "Male",phone_number: "078262333")
User.create(name: "Ioana" , email: "ioana@aaa.com" , age: 22,gender: "Female",phone_number: "0745846699")
User.create(name: "Andrei" , email: "andrei@aaa.com" , age: 25,gender: "Other",phone_number: "073629181")