# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  nickname: "haryu",
  email: "haryu@example.com",
  admin: "false",
  password: "password",
  password_confirmation: "password"
)

50.times do |n|
  user = User.first
  user.questions.create(
    title: "test#{n}",
    body: "これはテストシードで作成したものです。ナンバー#{n}"
  )
end

50.times do |i|
  User.create(
    email: "テスト#{i}@example.com",
    nickname: "テスト#{i}",
    password: "password",
    password_digest: "password",
    admin: false
  )
end