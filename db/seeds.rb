User.create!(name: "Tang Hoai Duy",
  email: "duyth1993@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true)

User.create!(name: "Nguyen Hoang Nam",
  email: "hnam2812@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@fels.org"
  password = "123456"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

5.times do |n|
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(5).join("-")
  Category.create!(name: name)
end

categories = Category.order(:created_at).take(5)

categories.each do |category|
  50.times do |_|
    category.words.create! content: Faker::Lorem.word
  end
end

words = Word.all

words.each do |word|
  4.times do |n|
    n == 0 ? is_true = 1 : is_true = 0
    word.answers.create!(content: Faker::Lorem.word, correct: is_true)
  end
end

categories.each do |category|
  user.lessons.create! category_id: category.id
end
