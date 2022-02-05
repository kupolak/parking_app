# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

5.times do |n|
  u = User.new(full_name: Faker::Name.name, member_id: n+1)
  u.save!
  p "Seeding with: full_name: #{u.full_name}, member_id: #{u.member_id}"
end

20.times do |n|
  s = Spot.new(name: "Spot number #{n+1}", status: %w[reserved available].sample)
  s.save!
  p "Seeding with: name: #{s.name}, status: #{s.status}"
end

15.times do |n|
  b = Booking.new(pickup_time: Time.now, return_time: Time.now + 1.day, spot_id: n+1, user_id: rand(1..5))
  b.save!
  p "Seeding with: pickup_time: #{b.pickup_time}, return_time: #{b.return_time}, spot_id: #{b.spot_id}, user_id: #{b.user_id}"
end

