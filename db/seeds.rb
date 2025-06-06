require 'faker'


puts "Création des cities"
cities = 10.times.map do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

puts "Création des users"
users = 10.times.map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(18..70),
    city: cities.sample
  )
end

puts "Création des gossips"
gossips = 20.times.map do
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )
end

puts "Création des tags"
tags = 10.times.map do
  Tag.create!(
    title: "##{Faker::Lorem.unique.word}"
  )
end

puts "Association des tags aux gossips"
gossips.each do |gossip|
  gossip.tags << tags.sample(rand(1..3))
end

puts "Mission accomplie"
