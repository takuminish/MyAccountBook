FactoryBot.define do
    factory :date_purchase do
        date {Faker::Date.backward}
        total_cost {Faker::Number.number}

    end
end