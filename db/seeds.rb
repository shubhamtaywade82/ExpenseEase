# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


10.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  name = [first_name, last_name].join(" ")

  email = Faker::Internet.email(name: name, domain: 'example.com')
  username = Faker::Internet.username(specifier: name)

  user = User.new(first_name: first_name, last_name: last_name, username: username, email: email, password: "Password")
  user.save if user.valid?
end
