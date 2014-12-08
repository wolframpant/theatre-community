require 'faker'

# Create plays
Play.create!(
    title: 'The Clean House',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: "Dead Man's Cell Phone",
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Dear Elizabeth',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Demeter in the City',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Eurydice',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'In the Next Room, or the Vibrator Play',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Late, A Cowboy Song',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Melancholy Play',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'The Oldest Boy',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Passion Play',
    body: Faker::Lorem.paragraph
)

Play.create!(
    title: 'Stage Kiss',
    body: Faker::Lorem.paragraph
)

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
    date_opened: Faker::Business.credit_card_expiry_date,
    user: users.sample)
end
productions = Production.all

# Create Impressions
50.times do
  Impression.create!(
    user: users.sample,
    production: productions.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
)
  Impression.last.play_id = Impression.last.production.play_id
end
impressions = Impression.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    impression: impressions.sample,
    body: Faker::Lorem.paragraph
  )
  Comment.last.play_id = Comment.last.impression.play_id
end

# Create an admin
User.create!(
  name: 'Ellen',
  email: 'llnwlfsn@gmail.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  admin: true,
  confirmed_at: Time.now
)

puts "Seed finished"
puts "#{Impression.count} impressions created"
puts "#{Comment.count} comments created"
puts "#{Play.count} plays created"
puts "#{User.count} users created"
puts "#{Production.count} productions created"
