FactoryBot.define do
  factory :category do
    name { "Categoria #{rand(0..10)}" }
  end
end
