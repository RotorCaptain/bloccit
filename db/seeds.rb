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
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

<<<<<<< HEAD
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
=======
50.times do
  Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1..1000))
  end

  
50.times do
  Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: rand(0..1))
end

  
10.times do
    SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..25))
  end

SponsoredPost.find_or_create_by(title: 'I would like one billion dollars', body: 'I think I deserve it.', price: 1000000000)

Topic.find_or_create_by(name: 'The most great topic', description: 'To describe this topic would be redundant')

Question.find_or_create_by(title: 'I have the perfect question', body: 'why?', resolved: 1)

Advertisement.find_or_create_by(title: 'Do you want to advertise ads?', copy: 'It is the most rediculous job in the world', price: 1)

Post.find_or_create_by(title: 'This is my unique title.', body: 'This is the body of my unique post')

Comment.find_or_create_by(post_id: 'This is the comment on my unique post')

user = User.first
user.update_attributes!(
  email: 'gracie.the.sheltie@bloc.io',
  password: 'helloworld'
>>>>>>> checkpoint-39
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
