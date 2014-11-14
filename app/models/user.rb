class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true, length: { maximum: 50 }
                    
  has_secure_password
  validates :password, length: { minimum: 6 }

  # Compute a test password value for the database fixture(s). 
  # This is a class method because we won't always have a
  # User instance when we need a new password_digest.
  #
  # string - The String password to compute the digest of.
  #
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST 
                                                : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
