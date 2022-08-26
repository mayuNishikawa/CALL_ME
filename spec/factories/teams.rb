FactoryBot.define do
  factory :team do
    name { "factory team" }
    owner { FactoryBot.create(:user) }
  end
end