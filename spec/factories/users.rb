FactoryBot.define do
  factory :user do
    family_name {"example"}
    first_name { "user" }
    nickname {"nickname"}
    email { "user@example.com" }
    password { "useruser" }
    admin { false }
  end
end