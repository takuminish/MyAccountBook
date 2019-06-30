FactoryBot.define do
    factory :product do
        name {Faker::App.name}
        price {Faker::Number.number}
    end
end