class Post < ActiveRecord::Base
  has_many :comments
    
  def self.all_with_censored
    all.each_with_index do |post, i| 
      if i % 5 == 0
        post.title = "CENSORED"
      end
    end
  end
end
