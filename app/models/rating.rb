class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]

  has_many :ratings
  
  belongs_to :rateable, polymorphc: true
  belongs_to :rating
  
  has_many :topics, through: :ratings, source: :rateable, source_type :Topic
  
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post
  
end