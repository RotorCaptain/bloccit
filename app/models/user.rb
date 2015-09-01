class User < ActiveRecord::Base
  has_many :posts
    
<<<<<<< HEAD
  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }
    
=======
  before_save  :downcase_email

  

>>>>>>> checkpoint-39
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX = /\A[A-Z][a-z]*\b/
    
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    
  validates :password, presence: true, length: {minimum: 6}
    
  validates   :email,
              presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 100 },
              format: { with: EMAIL_REGEX }
    
  has_secure_password
  
<<<<<<< HEAD
  enum role: [:member, :admin]
=======
  def downcase_email
    self.email = email.downcase
  end
>>>>>>> checkpoint-39
end
