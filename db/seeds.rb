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
