FactoryBot.define do
    factory :product_category do
        id {Faker::Number.number}
        name {Faker::App.name}
    end
end