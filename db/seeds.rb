# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "foobarbar",
             password_confirmation: "foobarbar")

# 追加のユーザーをまとめて生成する
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.imageposts.create!(title: title, content: content) }
end
