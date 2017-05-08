class User < ActiveRecord::Base
    # attr_accessor :password, :password_confirmation
    before_save { self.email = email.downcase }
    validates :username, presence: true, 
              uniqueness: { case_sensitive: false }, 
              length: { minimum: 3, maximum: 25 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
              uniqueness: { case_sensitive: false },
              length: { maximum: 105 },
              format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    # dependent: :destroy means when the user is deleted, so will all of their chains
    has_many :chains, dependent: :destroy
end