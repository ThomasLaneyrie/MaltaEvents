# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Food.description
   )
end

5.times do |index|
  Event.create(
    start_date: DateTime.strptime('2024-02-20T04:05:06+07:00', '%Y-%m-%dT%H:%M:%S%z'),
    duration: 55,
    title: Faker::Lorem.paragraph_by_chars(number: 6, supplemental: false),
    description: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false),
    price: rand(1..1000),
    location: ["Santa Venera", "Attard", "Valetta", "San Julian", "Mdina", "Sliema", "Gzira"].sample,
    administrator: User.all.sample
   )
end

5.times do |index|
  Attendance.create(
    stripe_customer_id: ["strip toi même", "lache la tunes"].sample,
    attendant: User.all.sample,
    event: Event.all.sample 
   )
end

puts "Seeds réalisés avec succès !"
