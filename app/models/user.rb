class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true
    
    has_secure_password
    
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
    validates :password, presence: true,
                       length: { minimum: 8 , maximum: 32},
                       format: {
                         with: VALID_PASSWORD_REGEX
                       },
                       allow_blank: true
                       
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }
end
