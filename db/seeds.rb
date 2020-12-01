# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_initialize_by(email: 'user1@example.com') do |user|
  user.username = 'user1'
  user.password = 'passwordofuser1'
  user.save!
end

User.find_or_initialize_by(email: 'user2@example.com') do |user|
  user.username = 'user2'
  user.password = 'passwordofuser2'
  user.save!
end
