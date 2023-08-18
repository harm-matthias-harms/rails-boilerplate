# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }

    before :create, &:skip_confirmation!
    after :create, &:confirm

    trait :confirmed do
      confirmed_at { Time.zone.now }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
