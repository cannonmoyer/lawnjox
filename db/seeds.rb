# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Address.create(street: "1250 McIngvale Rd", state: "MS", city: "Hernando", zip: "38632", square_feet: 1000)
Address.create(street: "9296 Brooks Drive", state: "MS", city: "Olive Branch", zip: "38654", square_feet: 10000)
Address.create(street: "1234 Time Square", state: "NY", city: "New York City", zip: "77372", square_feet: 9500)

User.create(email: "cannonmoyer@yahoo.com", password: "ljo183xs4", password_confirmation: "ljo183xs4")