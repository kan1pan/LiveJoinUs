  email = Faker::Internet.email
  password = "password"
  uid = SecureRandom.uuid
  User.create!(email: email,
              password: password,
              password_confirmation: password,
              name: "test",
              confirmed_at: Time.now
              )
