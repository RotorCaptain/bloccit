include RandomData

5.times do
  user = User.create!(
    
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all
    
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
  )

Topic.find_or_create_by(name: 'The most perfect topic', description: 'To describe this topic would be silly')

Post.find_or_create_by(title: 'This is my unique title.', body: 'This is the body of my unique post')

Comment.find_or_create_by(post_id: 'This is the comment on my unique post')

user = User.first
user.update_attributes!(
  email: 'gracie.the.sheltie@bloc.io',
  password: 'helloworld'

  )
  
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  )  

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
        
        # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
