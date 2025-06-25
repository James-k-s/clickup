# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing all records..."

Task.destroy_all
User.destroy_all

james = User.new(
  email: "james@james.com",
  password: "password",
  password_confirmation: "password"
)
james.save!

puts "Users created, #{User.all.count} total users"

task1 = Task.new(
  name: "Brush teeeth",
  priority: "Urgent",
  status: "To be done",
  end_date: "Today!",
  user_id: james.id
)

task2 = Task.new(
  name: "Finish app",
  priority: "Urgent",
  status: "In progress",
  end_date: "Friday",
  user_id: james.id
)

task3 = Task.new(
  name: "Get a Job",
  priority: "Urgent",
  status: "In progress",
  end_date: "31 June 2025",
  user_id: james.id
)

task4 = Task.new(
  name: "Make dinner",
  priority: "Not urgent",
  status: "Tobe done",
  end_date: "6pm",
  user_id: james.id
)

task1.save!
task2.save!
task3.save!
task4.save!

puts "Tasks created, #{Task.all.count} total tasks"

puts "Seed file has been succesfully created"
