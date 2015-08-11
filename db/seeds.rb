require 'faker'

50.times do
    Post.create!(
        title: Faker::Lorem.sentence,
        body:  Faker::Lorem.paragraph
    )
end
posts = Post.all


100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Lorem.paragraph
    )
end

1.times do
    Post.find_or_create_by(
        title: "A Unique Title!",
        body: "This is a very unique post."
    )
end
posts = Post.all

1.times do
    Comment.find_or_create_by(
        post: posts.sample,
        body: "This is a unique comment."
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
        

