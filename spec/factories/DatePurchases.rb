FactoryBot.define do
    factory :date_purchase do
        date {Faker::Date.backward}

    end
end