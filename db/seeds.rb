# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all
User.destroy_all

30.times do |i|
  User.create(
    name: Faker::Name.name,
    email: "user#{i + 1}@gmail.com",
    password: '123456'
  )
end

20.times do
  Company.create(
    name: Faker::Company.name
  )
end

users = User.all
companies = Company.all

250.times do 
  Complaint.create(
    user: users.sample,
    company: companies.sample,
    content: Faker::Lorem.paragraph
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?