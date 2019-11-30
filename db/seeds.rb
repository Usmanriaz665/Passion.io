ActionMailer::Base.perform_deliveries = false

# creating user
user = User.create!(name: "test", email: "testuser@test.com", password: "12345678", password_confirmation: "12345678")

# creating verticals
verticals = ["vertical 1", "vertical 2", "vertical 3", "vertical 4", "vertical 5", "vertical 6", "vertical 7", "vertical 8", "vertical 9", "vertical 10"]

verticals.each do |vertical_name|
  vertical = Vertical.create!(name: vertical_name)
  # creating categories
  category1 = vertical.categories.create!(name: vertical_name + "category 1", state: "active")
  category2 = vertical.categories.create!(name: vertical_name + "category 2", state: "disabled")
  category3 = vertical.categories.create!(name: vertical_name + "category 3", state: "active")

  #creating courses
  category1.courses.create!(name: category1.name + "course 1", author: category1.name + "author 1", state: "disabled")
  category1.courses.create!(name: category1.name + "course 2", author: category1.name + "author 2", state: "active")
  category2.courses.create!(name: category2.name + "course 1", author: category2.name + "author 1", state: "disabled")
  category2.courses.create!(name: category2.name + "course 2", author: category2.name + "author 2", state: "active")
  category3.courses.create!(name: category3.name + "course 1", author: category3.name + "author 1", state: "disabled")
  category3.courses.create!(name: category3.name + "course 2", author: category3.name + "author 2", state: "active")
end