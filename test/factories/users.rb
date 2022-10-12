# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Joe Doe" }
    sequence(:email) { |n| "joe.doe#{n}@example.com" }
    password { "pasword123" }

    trait :merchant do
      role { :merchant }
    end
  end
end
