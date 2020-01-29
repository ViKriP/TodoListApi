FactoryBot.define do
  factory :comment do
    text { FFaker::Lorem.characters(11) }
    task { association :task }
  end
end
