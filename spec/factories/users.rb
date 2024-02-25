# frozen_string_literal: true

FactoryBot.define do

  factory :user do
    sequence(:first_name) { |n| Faker::Name.unique.first_name }
    sequence(:last_name) { |n| Faker::Name.unique.last_name }

    username { Faker::Internet.username(specifier: [first_name, last_name].join(' ')) }
    email { Faker::Internet.email(name: [first_name, last_name].join(' '), domain: 'example.com') }
    password { 'password' }
  end
end
