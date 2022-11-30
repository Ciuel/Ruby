# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

class Set
  def pop
    temp = self.to_a.pop
    self.delete(temp)
    temp
  end
end

#Make 10 example branches with its respective schedules
10.times do
  branch = Branch.create!(name: Faker::Company.name, address: Faker::Address.full_address, telephone: Faker::PhoneNumber.phone_number)
  #Make a set containing all weekdays in spanish
  days = Set.new(%w[Lunes Martes Miercoles Jueves Viernes Sabado Domingo])
  5.times do
    Schedule.create!(branch_id: branch.id, day: days.pop, start_time: Time.parse("#{rand(8..12)}:00"), end_time: Time.parse("#{rand(13..17)}:00"))

  end
end
#Make 10 users and assign them random roles
10.times do
  role = rand(0..2)
  if role == 2
    User.create!(email: Faker::Internet.email, password: '123456', password_confirmation: '123456', role:2, branch_id: rand(1..10))
  else
    User.create!(email: Faker::Internet.email, password: '123456', password_confirmation: '123456', role: rand(0..1))
  end
end
#create admin user
u = User.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456', role: 1)
p "db seeded"