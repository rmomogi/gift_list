FactoryBot.define do
  factory :gift_list do
    name { "Lista #{rand(0..10)}" }
  end
end
