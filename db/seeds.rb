require 'faker'

# Create Impressions
50.times do
  Impression.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
impressions = Impression.all

# Create Comments
100.times do
  Comment.create!(
    impression: impressions.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{Impression.count} impressions created"
puts "#{Comment.count} comments created"
