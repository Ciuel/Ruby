# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Make 10 example branches with its respective schedules
10.times do
  branch = Branch.create(name: Faker::Company.name, address: Faker::Address.full_address, telephone: Faker::PhoneNumber.phone_number)
  5.times do
    branch.schedules.create(day: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'), start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
  end
end
#Make 10 users
10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end
p "db seeded"