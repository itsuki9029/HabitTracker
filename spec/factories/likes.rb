FactoryBot.define do
  factory :like do
    association :user
    association :habit
  end
end
