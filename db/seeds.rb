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
ListItem.destroy_all
List.destroy_all
TaskComment.destroy_all
Task.destroy_all
User.destroy_all


james = User.new(
  first_name: "James",
  last_name: "Shuttleworth",
  email: "james@james.com",
  password: "password",
  password_confirmation: "password"
)
james.save!

puts "Users created, #{User.all.count} total users"

task1 = Task.new(
  name: "Brush teeeth",
  description: "Brush your teeth thoroughly for at least two minutes to maintain good oral hygiene. Don’t forget to brush all surfaces and your tongue!",
  priority: "Medium",
  status: "To do",
  end_date: "Today!",
  user_id: james.id
)

task2 = Task.new(
  name: "Finish app",
  description: "Complete all remaining features, fix any outstanding bugs, and ensure the application is ready for deployment. Review the project requirements and test thoroughly before launch.",
  priority: "High",
  status: "In progress",
  end_date: "Friday",
  user_id: james.id
)

task3 = Task.new(
  name: "Get a Job",
  description: "Search and apply for relevant job opportunities, tailor your resume and cover letter, and prepare for interviews to secure a new position.",
  priority: "Urgent",
  status: "In progress",
  end_date: "31 June 2025",
  user_id: james.id
)

task4 = Task.new(
  name: "Make dinner",
  description: "Prepare a healthy and delicious meal for yourself or your family. Plan the menu, gather ingredients, and enjoy the cooking process.",
  priority: "Low",
  status: "To do",
  end_date: "6pm",
  user_id: james.id
)

task1.save!
task2.save!
task3.save!
task4.save!
puts "creating task comments"

task_comment1 = TaskComment.new(
  comment: "make sure it is done before 8pm",
  task_id: task1.id,
  user_id: james.id
)

task_comment2 = TaskComment.new(
  comment: "Do not eat anything after you have brushed your teeth",
  task_id: task1.id,
  user_id: james.id
)

task_comment3 = TaskComment.new(
  comment: "Brushing your teeth will make them perals white",
  task_id: task1.id,
  user_id: james.id
)

task_comment1.save!
task_comment2.save!
task_comment3.save!
puts "comments created, #{TaskComment.all.count} total comments"

puts "Tasks created, #{Task.all.count} total tasks"

puts "Creating lists..."

list1 = List.new(
  name: "Shopping List",
  user_id: james.id,
  status: "To do",
  category: "Shopping"
)

list2 = List.new(
  name: "Work Tasks",
  user_id: james.id,
  status: "In progress",
  category: "Work"
)
list3 = List.new(
  name: "Personal Goals",
  user_id: james.id,
  status: "To do",
  category: "Personal"
)

list1.save!
list2.save!
list3.save!

puts "Lists created, #{List.all.count} total lists"

list_item1 = ListItem.new(
  description: "Buy milk",
  list_id: list1.id,
  status: "To do"
)


list_item2 = ListItem.new(
  description: "Buy bread",
  list_id: list1.id,
  status: "To do"
)

list_item3 = ListItem.new(
  description: "Complete project report",
  list_id: list2.id,
  status: "In progress"
)

list_item4 = ListItem.new(
  description: "Exercise for 30 minutes",
  list_id: list3.id,
  status: "To do"
)


list_item5 = ListItem.new(
  description: "Buy eggs",
  list_id: list1.id,
  status: "To do"
)


list_item6 = ListItem.new(
  description: "Buy tomatoes",
  list_id: list1.id,
  status: "To do"
)

list_item1.save!
list_item2.save!
list_item3.save!
list_item4.save!
list_item5.save!

list_item6.save!
puts "List items created, #{ListItem.all.count} total items"

puts "Seed file has been succesfully created"
