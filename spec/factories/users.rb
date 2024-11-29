FactoryBot.define do
  factory :user do
    email { "john_snow@gmail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
