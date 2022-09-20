class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message:"must be a valid email adress" }
end
