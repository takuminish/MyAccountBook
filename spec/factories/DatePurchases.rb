FactoryBot.define do
    factory :date_purchase do
        id {Faker::Number.number}
        date {Faker::Date.backward}
        total_cost {Faker::Number.number}

    end
end