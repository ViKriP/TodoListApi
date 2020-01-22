FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    deadline { rand(1..10).years.from_now }
    completed { false }
    project
  end
end
