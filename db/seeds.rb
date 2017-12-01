User.create!(name_user: "Tino ne",
             email: "tinobia@gmail.com",
             tel: "01283755270",
             password: "tinobia112",
             password_confirmation: "tinobia112",
             gender: true,
             address: "Big C Da Nang")
User.create!(name_user: "Example User",
             email: "example@railstutorial.org",
             tel: "090509050905",
             password: "foobar",
             password_confirmation: "foobar",
             gender: false,
             address: "Vinh Trung Plaza")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@tino.com"
  password = "password"
  tel = "0123113113"
  gender = true
  address = "a bo co"
  User.create!(name_user:  name,
               email: email,
               tel: tel,
               password: password,
               password_confirmation: password,
               gender: gender,
               address: address)
end
