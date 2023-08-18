# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }

    trait :confirmed do
      confirmed_at { Time.zone.now }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
