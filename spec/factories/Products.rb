FactoryBot.define do
    factory :product do
        id {Faker::Number.number}
        name {Faker::App.name}
        price {Faker::Number.number}
    end
end