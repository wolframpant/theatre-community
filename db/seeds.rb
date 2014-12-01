require 'faker'

# Create plays
12.times do
  Play.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
plays = Play.all


# Create Users
5.times do
  User.create!(
    name: Faker::name,
    email: Faker::Internet.email,
    password: 'helloworld',
    password_confirmation: 'helloworld',
    admin: false,
    confirmed_at: Time.now)
end
users = User.all

#Create Productions
50.times do
  Production.create!(
    play: plays.sample,
    company: Faker::Company.name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    date: Faker::Business.credit_card_expiry_date,
    user: users.sample)
end
productions = Production.all

# Create Impressions
50.times do
  Impression.create!(
    user: users.sample,
    play: plays.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    production: productions.sample
)
end
impressions = Impression.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    impression: impressions.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{Impression.count} impressions created"
puts "#{Comment.count} comments created"
puts "#{Play.count} plays created"
puts "#{User.count} users created"
puts "#{Production.count} productions created"
