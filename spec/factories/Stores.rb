FactoryBot.define do
    factory :store do
        id {Faker::Number.number}
        name {Faker::App.name}
    end
end